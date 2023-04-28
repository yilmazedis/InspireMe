import XCTest
import PlaygroundSupport

protocol ImageService {
    func loadItems(completion: @escaping (Result<[User], APIError>) -> Void)
}

extension ImageService {
    func fallback(_ fallback: ImageService) -> ImageService {
        ImageServiceWithFallback(primary: self, fallback: fallback)
    }
    
    func retry(_ retyCount: UInt) -> ImageService {
        var service: ImageService = self
        for _ in 0..<retyCount {
            service = service.fallback(self)
        }
        return service        
    }
}

// Composite
struct ImageServiceWithFallback: ImageService {
    let primary: ImageService
    let fallback: ImageService
    
    func loadItems(completion: @escaping (Result<[User], APIError>) -> Void) {
        primary.loadItems { result in
            switch result {
            case.success:
                completion(result)
            case.failure:
                fallback.loadItems(completion: completion)
            }
        }
    }
}

struct ApiServiceAdapter: ImageService {
    let apiService: MyAPIService!
    let url: URL
    
    func loadItems(completion: @escaping (Result<[User], APIError>) -> Void) {
        apiService.fetch(with: url) { (result: Result<[User], APIError>) in
            switch result {
            case .success(let fetchedUsers):
                completion(.success(fetchedUsers))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}

struct CacheImageServiceAdapter: ImageService {
    let api: UIImageView
    let url: URL
    
    func loadItems(completion: @escaping (Result<[User], APIError>) -> Void) {
        api
    }
}

class URLSessionMock: URLSession {
    
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    var lastURL: URL?
    var lastHTTPMethod: String?
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastURL = url
        lastHTTPMethod = "GET"
        completionHandler(data, response, error)
        return URLSessionDataTask()
    }
}

struct User: Codable {
    let id: Int
    let name: String
}

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case requestFailed(Error)
    case decodingFailed(Error)
}

class MyAPIService {
    
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetch<T: Codable>(with url: URL?, completion: @escaping (Result<[T], APIError>) -> Void) {
        
        guard let url = url else {
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let jsonData = data else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let users = try JSONDecoder().decode([T].self, from: jsonData)
                completion(.success(users))
            } catch let error {
                completion(.failure(.decodingFailed(error)))
            }
        }
        task.resume()
    }
    
}



class ImageServiceTests: XCTestCase {
    var apiService: MyAPIService!
    var session: URLSessionMock!
    var apiServiceAdapter: ApiServiceAdapter!
    let url = URL(string: "https://myapi/users")!
    
    override func setUp() {
        super.setUp()
        session = URLSessionMock()
        apiService = MyAPIService(session: session)
        apiServiceAdapter = ApiServiceAdapter(apiService: apiService, url: url)
    }
    
    func testGetUsers() {
        
        let jsonData = """
        [
            {
                "id": 1,
                "name": "Leanne Graham"
            },
            {
                "id": 2,
                "name": "Ervin Howell"
            }
        ]
        """.data(using: .utf8)!
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
        session.data = jsonData
        session.response = response
        
        var users: [User]?
        var error: Error?
        
        var counter = 0
        apiServiceAdapter.loadItems { [weak self] (result: Result<[User], APIError>) in
            
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let fetchedUsers):
                users = fetchedUsers
            case .failure(let err):
                error = err
                
                if counter == 8 {
                    let response = HTTPURLResponse(url: self.url, statusCode: 200, httpVersion: nil, headerFields: nil)!
                    self.session.response = response
                }
                
                counter += 1
            }
        }
        
        apiServiceAdapter.retry(6)
        
        XCTAssertNil(error)
        XCTAssertNotNil(users)
        XCTAssertEqual(users?.count, 2)
        XCTAssertEqual(users?.first?.id, 1)
        XCTAssertEqual(users?.first?.name, "Leanne Graham")
        XCTAssertEqual(users?.last?.id, 2)
        XCTAssertEqual(users?.last?.name, "Ervin Howell")
        
        XCTAssertEqual(session.lastURL, URL(string: "https://myapi/users"))
        XCTAssertEqual(session.lastHTTPMethod, "GET")
    }
}

ImageServiceTests.defaultTestSuite.run()
