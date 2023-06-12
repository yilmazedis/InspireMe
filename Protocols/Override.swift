protocol Car {
    var types: [String] { get set }

    func sell() // when you write this line, CarShop can override sell() function otherwise it calls that sell function inside of the extension
}

extension Car {
    func sell() {
        print("Sell Car")
    }
}

class CarShop: Car {
    var types: [String] = []
    
    func sell() {
        types.append("A")
    }
}

// here Car is reference of obje
let car1: Car = CarShop()
car1.sell()
print(car1.types)

let car2: CarShop = CarShop()
car2.sell()
print(car2.types)
