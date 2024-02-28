/* In Swift, Automatic Reference Counting (ARC) manages the memory usage of your app. 
It automatically deallocates instances when they are no longer needed. Here's how you can use strong, weak, and unowned references:
*/

/*
Strong Reference: A strong reference increases the reference count of an object, keeping it in memory until all strong references to it are gone.
*/
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var person1: Person?
var person2: Person?
var person3: Person?

person1 = Person(name: "John")
person2 = person1 // Strong reference
person3 = person1 // Strong reference

person1 = nil
person2 = nil // This does not deinitialize the object
person3 = nil // This deinitializes the object

/*
Weak Reference: A weak reference does not increase the reference count. 
It automatically becomes nil when the object it refers to is deallocated. 
Use weak references to avoid reference cycles.
*/
class Apartment {
    let unit: String
    
    init(unit: String) {
        self.unit = unit
    }
    
    weak var tenant: Person? // Weak reference
    
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is initialized")
    }
    
    var apartment: Apartment? // Strong reference
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A // Strong reference
unit4A!.tenant = john // Weak reference

john = nil // Deinitializes Person, breaks the reference cycle
unit4A = nil // Deinitializes Apartment

// or

class Person {
    let name: String
    
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("\(name) is initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    
    init(unit: String) {
        self.unit = unit
    }
    
    weak var tenant: Person? // Weak reference
    
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A // Strong reference
unit4A!.tenant = john // Weak reference

john = nil // Deinitializes Person, breaks the reference cycle
unit4A = nil // Deinitializes Apartment

/*
Unowned Reference: An unowned reference is similar to a weak reference, 
but it assumes that the referenced object will never be nil.
Use unowned references when you know that the referenced object will outlive the referring object.
*/
class Customer {
    let name: String
    
    var creditCard: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: Int
    
    unowned let customer: Customer
    
    init(number: Int, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("Credit card #\(number) is being deinitialized")
    }
}

var john: Customer?
john = Customer(name: "John")
john!.creditCard = CreditCard(number: 1234_5678_9012_3456, customer: john!) // Unowned reference

john = nil // Deinitializes Customer and CreditCard

