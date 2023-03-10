/*

In Swift, dynamic dispatch is a mechanism used to determine which method or function to call at runtime, rather than at compile-time. It is used in situations where the specific type of an object is not known at compile-time, such as when working with protocols or when using inheritance.

When a method or function is called using dynamic dispatch, the runtime system checks the actual type of the object at runtime and then calls the appropriate method or function. This allows the code to work with objects of different types without knowing their specific type at compile-time.

Dynamic dispatch is used extensively in Swift's object-oriented features, such as inheritance and protocols. It is also used in the standard library, for example, when working with collections like Array and Dictionary, which can hold elements of different types.

For example:

*/

protocol Shape {
    func area() -> Double
}

class Circle: Shape {
    var radius: Double
    init(radius: Double) { self.radius = radius }
    func area() -> Double { return .pi * radius * radius }
}

class Square: Shape {
    var side: Double
    init(side: Double) { self.side = side }
    func area() -> Double { return side * side }
}

let shapes: [Shape] = [Circle(radius: 2), Square(side: 3)]
for shape in shapes {
    print(shape.area())
}

func printArea(of shape: Shape) {
    print(shape)
}

/*

In the above example, the area method is called on the elements of the shapes array, which is of type [Shape]. Since the type of the elements is not known at compile time, Swift uses dynamic dispatch to call the appropriate implementation of area() method at runtime.

Dynamic dispatch is an important concept in Swift, it allows to write flexible and reusable code by working with abstract concepts rather than concrete types.

*/

/*

Can we call it Polymorphism also ?

In a nutshell, dynamic dispatch is a mechanism used to implement polymorphism in Swift, where the specific implementation of a method or function is determined at runtime based on the actual type of the object.

*/
