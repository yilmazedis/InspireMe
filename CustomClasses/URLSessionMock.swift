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
    
    override func setUp() {
        super.setUp()
        session = URLSessionMock()
        apiService = MyAPIService(session: session)
    }
    
    func testGetUsers() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
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
        let expectation = self.expectation(description: "getUsers")
        
        apiService.fetch(with: url) { (result: Result<[User], APIError>) in
            switch result {
            case .success(let fetchedUsers):
                users = fetchedUsers
            case .failure(let err):
                error = err
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        
        XCTAssertNil(error)
        XCTAssertNotNil(users)
        XCTAssertEqual(users?.count, 2)
        XCTAssertEqual(users?.first?.id, 1)
        XCTAssertEqual(users?.first?.name, "Leanne Graham")
        XCTAssertEqual(users?.last?.id, 2)
        XCTAssertEqual(users?.last?.name, "Ervin Howell")
        
        XCTAssertEqual(session.lastURL, URL(string: "https://jsonplaceholder.typicode.com/users"))
        XCTAssertEqual(session.lastHTTPMethod, "GET")
    }
}

ImageServiceTests.defaultTestSuite.run()
