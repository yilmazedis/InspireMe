protocol Car {
    associatedtype Identifier
    var id: Identifier { get }
}

struct BMW: Car {
    //typealias Identifier = String
    let id: String
    // If you pass BMW as paramater in Car type. You cannot access name.
    let name: String = "BMW"
    
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

// any or some
func getFavoriteCar(car: any Car) -> some Car {
    let id = car.id
    // let name = car.name // you cannot access name, because it comes from Car protocol
    return BMW(id: "bmw")
    //return Honda(id: 123)
}

print(String(describing: getFavoriteCar(car: BMW(id: "12314"))))
