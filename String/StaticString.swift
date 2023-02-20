/*

In Swift, a staticString is a type that represents a string value that is known at compile time and is guaranteed to remain constant at runtime.

Unlike a regular String, a staticString is not mutable, which means you cannot modify its value once it is defined. This makes it a useful tool for creating strings that will be used as constants or as arguments to functions that expect a string value.

One important feature of staticString is that it is optimized for performance. Because its value is known at compile time, the compiler can perform various optimizations to improve performance, such as avoiding unnecessary string allocations and reducing the size of the executable.

You can create a staticString using the #""# syntax, which allows you to define a string literal without any interpolation or escape sequences. Here's an example:

*/

let greeting: staticString = #"Hello, world!"#


// what is the main difference between staticString and let string. 

/*

The main difference between a staticString and a let string in Swift is that a staticString is a compile-time constant while a let string is a run-time constant.

A staticString is a type that represents a string value that is known at compile time and is guaranteed to remain constant at runtime. It is optimized for performance and is useful for creating strings that will be used as constants or as arguments to functions that expect a string value. Because it is known at compile time, the compiler can perform various optimizations to improve performance.

On the other hand, a let string is a variable that is declared using the let keyword and is assigned a value at runtime. Once assigned, its value cannot be changed. While it is also a constant, it is not known at compile time and does not offer the same level of performance optimizations as a staticString.

Here's an example to illustrate the difference:

*/

let greeting1 = "Hello, World!" // A let string
let greeting2: staticString = #"Hello, World!"# // A staticString

print(greeting1)
print(greeting2)

/*

In this example, greeting1 is a let string that is assigned the value "Hello, World!" at runtime. greeting2 is a staticString that is assigned the same value but is known at compile time. Both variables are constants and their values cannot be changed, but greeting2 is optimized for performance and is useful for creating strings that will be used as constants or as arguments to functions that expect a string value.

*/

// if i declare like 
// let greeting: staticString = #"Hello, world!"#;
// or 
// var greeting: staticString = #"Hello, world!"#
// what is the difference 

/*

The difference between declaring a staticString using let and var keywords in Swift is the mutability of the variable.

When you declare a staticString using let, you are creating an immutable constant that cannot be modified after it is assigned a value. This is because staticString is a value type and is immutable by default. So, if you declare a staticString using let, you cannot change its value later in your program.

On the other hand, if you declare a staticString using var, you are creating a mutable variable that can be modified after it is assigned a value. However, even though you can declare a staticString using var, it is not recommended to modify its value, as it is intended to be a constant that is known at compile time.

Here's an example to illustrate the difference:

*/

let greeting1: staticString = #"Hello, World!"#
var greeting2: staticString = #"Hello, World!"#

// Trying to modify the value of greeting1 will result in a compiler error
// greeting1 = #"Hello, Universe!"#

// Modifying the value of greeting2 is technically allowed, but it's not recommended
greeting2 = #"Hello, Universe!"#

print(greeting1)
print(greeting2)


// do I have to put # ?

/*

Yes, when declaring a staticString using the #""# syntax in Swift, you need to include the # symbols at the beginning and end of the string literal.

The #""# syntax is a special string interpolation syntax that allows you to create a staticString that is optimized for performance. It is used to define a string literal without any interpolation or escape sequences. The # symbols indicate the start and end of the string literal, and they are required to distinguish the staticString from a regular string.

Here's an example of how to declare a staticString using the #""# syntax:

*/

let greeting: staticString = #"Hello, World!"#


/*

In this example, the greeting variable is assigned a staticString value of "Hello, World!" using the #""# syntax.

If you don't include the # symbols, the string literal will be treated as a regular string, which is not optimized for performance and does not have the same guarantees as a staticString.

*/
