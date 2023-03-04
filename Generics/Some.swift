protocol Car {
    associatedtype Identifier
    var id: Identifier { get }
}

struct BMW: Car {
    //typealias Identifier = String
    let id: String
    
    init(id: String) {
        self.id = id
    }
}

struct Honda: Car {
    //typealias Identifier = Int
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
}

func getFavoriteCar() -> some Car {
    return BMW(id: "bmw")
    //return Honda(id: 123)
}

print(String(describing: getFavoriteCar()))
