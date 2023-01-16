/*

struct Stack<T: String> is a generic struct where the generic type T is constrained to be of type String, this means that only instances of String or its subclasses can be used as the type argument when creating an instance of the struct.

struct Stack<Element> is a generic struct where the generic type Element has no constraints, this means that any type can be used as the type argument when creating an instance of the struct.

They are not the same, as the first one is just a stack of strings, and the second one is a stack of any type.

For example:

*/

struct Stack<T: String> {
    private var elements: [T] = []
    //...
}

var stack = Stack<String>()
stack.push("Hello")
stack.push("world")


/*

In the above example, you can see that stack can only hold elements of type String.

*/

struct Stack<Element> {
    private var elements: [Element] = []
    //...
}

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)

/*

In the above example, you can see that stack can hold elements of any type, in this case it's Int.

Constraining the generic type parameter can be useful in situations where you want to ensure that the elements in the stack have a specific type or conform to a specific protocol, It can be useful to ensure type safety and make the code more readable and maintainable.

*/
