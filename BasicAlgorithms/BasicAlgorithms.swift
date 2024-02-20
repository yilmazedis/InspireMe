func isValidSubsequence(_ array: [Int], _ sequence: [Int]) -> Bool {
    // Write your code here.
    
    let filtered = array.filter { first in
        !sequence.filter { second in
            first == second
        }.isEmpty
    }
    
    if filtered == sequence {
        return true
    }
    return false
}

let array = [5, 1, 22, 25, 6, -1, 8, 10]
let sequence = [1, 6, -1, 89]
// let sequence = [1, 6, -1, 10]
isValidSubsequence(array, sequence)

////////////////////////////////////////////////////////////
// Recursive Digit Sum
func superDigit(n: String, k: Int) -> Int {
    if n.count == 1 {
        return Int(n) ?? 0
    }
    
    let sum = n.compactMap(\.wholeNumberValue).reduce(0, +) * k
    return superDigit(n: String(sum), k: 1)
}

////////////////////////////////////////////////////////////
// @autoclosure
var ele = 0

func foo(para: @autoclosure () -> (Int)) {
    ele = para()
}

print(ele)
foo(para: 10)
print(ele)

// prints
// 0
// 10

////////////////////////////////////////////////////////////
// Type Inferred
// let val1: Result<Int, Never> = .success(10)
// Int Success == Int inferred
let val1: Result<_, Never> = .success(10)

// let compiler to help you to decide type when it become more and more complex
let val2: Result<_, Never> = .success(
    [1: ["o", "n", "e"]]
)

////////////////////////////////////////////////////////////
// private(set) for lazy properties
// Unfortunately, it's not possible for a `lazy` property to also be a `let` constant 😢
// But that's when the keyword `private(set)` comes to the rescue, to at least make the setter of the property inaccessible 😌
private lazy var myView: UIView = {
    let view = UIView()
    return view
}()

////////////////////////////////////////////////////////////
// willSet with struct
struct Spaceship {
    var name: String {
        willSet {
            print("I'm called \(newValue)!")
        }
    }
}

var serenity = Spaceship(name: "Serenity")
serenity.name = "TARDIS"
// Correct answer: "I'm called TARDIS!".
// Explanation: The willSet property observer is triggered only when the initial value is changed, 
// and not when the struct is created using memberwise initialization.

////////////////////////////////////////////////////////////
// Go to subscriptions page
if let url = URL(string: "itms-apps://apps.apple.com/account/subscriptions") {
    if UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:])
    }
}

////////////////////////////////////////////////////////////
// final example
final class Dog {
    func bark() {
        print("Woof!")
    }
}

class Corgi : Dog {
    override func bark() {
        print("Yip!")
    }
}

let muttface = Corgi()
muttface.bark()
// Correct answer: This code will not compile.
// Explanation: This code attempts to create a new class, Corgi, that inherits from an existing class, Dog. 
// Ordinarily that would be fine, but here the Dog class has been marked as final, which means it cannot be inherited from

// In Swift, the ~= operator is known as the "pattern matching operator." It is used to check if a value matches a pattern.
// Here's an example of how the ~= operator can be used:


////////////////////////////////////////////////////////////
// ~= operator
let number = 5
switch number {
case 1...10:
    print("The number is between 1 and 10.")
case 11...20:
    print("The number is between 11 and 20.")
default:
    print("The number doesn't match any specific range.")
}

// In the example above, the ~= operator is implicitly used in the case statements of a switch statement to check if the number falls within a specific range. 
// The operator compares the value on the left side (number) with the pattern on the right side (1...10 and 11...20) to determine if there is a match.
// Note that the ~= operator is primarily used internally by Swift's pattern matching system and is not commonly used directly in regular code.

////////////////////////////////////////////////////////////
// Nubers definitions
let oneMillion = 1_000_000
let oneThousand = oneMillion / 0_1_0_0_0
print(oneThousand)

// Correct answer: 1000.
// Explanation: Swift allows you to use any number of leading zeroes before a number, 
// and any number of underscores inside a number, in order to make reading easier. 
// The example given, 0_1_0_0_0, is unlikely, but a perfectly valid way to write 1000.


////////////////////////////////////////////////////////////
// Compiler Directive
// The Swift compiler directive that will force the compiler to issue an error is #error.
#if DEBUG
    // Perform debug-only operations here
#else
    #error("DEBUG flag not set")
#endif


////////////////////////////////////////////////////////////
// Flat Map
let numbers = [1, 2, 3].flatMap { [$0, $0] }

// Correct answer: [1, 1, 2, 2, 3, 3].
// Explanation: A call to map code would loop over every number in the numbers array, 
// and creates a new array for each number that contains that number twice. 
// So, 1 will be converted to [1, 1] and so on. In this case, we're using flatMap, 
// which causes the resulting array of arrays to be flattened to a single array, 
// meaning that [[1, 1]] would become [1, 1] and so on

let flat_1 = [[[2]], [[2]], [[2]], [[2]], [[2]]].flatMap { $0.flatMap { $0} }
// let flat_2 = [1, 2, 3].flatMap { [$0, $0] }
let flat_2 = [[1, 2], [3, 4], [5, 6]].flatMap { $0 }

print(flat_1) // [2, 2, 2, 2, 2]
print(flat_2) // [1, 2, 3, 4, 5, 6]

// flatMap just decrease 1 level of dimension array.
let flat_1 = [[[2]], [[2]], [[2]], [[2]], [[2]]].flatMap { $0 } // [[2], [2], [2], [2], [2]]

// Array must be in same level of elements, I mean if there is another level of element like 1 in example below, flatMap
// won't work as espected.
let flat_1 = [1, [[2]], [[2]], [[2]], [[2]], [[2]]].flatMap { $0 } // [1, [[2]], [[2]], [[2]], [[2]], [[2]]]

////////////////////////////////////////////////////////////
// Generic
func square<T>(_ value: T) -> T {
    return value * value
}

//Correct answer: This code will not compile.
//Explanation: This code has attempted to create a generic number squaring function, 
// but has failed to declare that T (the data type being used) has the ability to work with the * operator, 
// so Swift cannot compile it. One solution might be to modify it to square<T: BinaryInteger>, 
// which would allow it to work on Int, UInt, Int64 and so on.

////////////////////////////////////////////////////////////
// String
let string: String = String(describing: String.self)
print(string)
/*
Correct answer: "String".

Explanation: Among the many constructors for strings is one that lets you pass in a 
class to have the string set to the name of that class. That is, 
String(describing: String.self) means "create a string out of the name of the String class." 
This is equivalent to the NSStringFromClass() function that Objective-C developers often use.
*/

////////////////////////////////////////////////////////////
// loop
let data: [Any?] = ["Bill", nil, 69, "Ted"]

for datum in data where datum is String? {
    print(datum)
}

for case let .some(datum) in data where datum is String {
    print(datum)
}
/*
Correct answer: The first loop prints more lines than the second.

Explanation: There is a very subtle difference between the two loops, and it's triggered by the data type of the array: this is an array of Any? not an array of strings. The first loop will attempt to typecast its items as String?, which means the loop element must either be a string or nil – that's true of three items. The second loop, however, begins by unwrapping the optional, so it will either be Any or String, at which point our where clause will work. So, the second loop prints two lines.
*/

////////////////////////////////////////////////////////////
// Optional
let names: [String?] = ["Barbara", nil, "Janet", nil, "Peter", nil, "George"]

if let firstName = names.first {
    print(firstName)
}
/*
Correct answer: Optional("Barbara").
Explanation: The names array contains values of type String?, but names.first adds an extra level of optionality because it will return nil if there are no items in the array. So, in this code names.first will return String?? (an optional optional String), of which one layer is unwrapped using the if let.
*/

////////////////////////////////////////////////////////////
// Array
var names = [String]()
names.append("Amy")
let example1 = names.removeLast()
let example2 = names.removeLast()

/*
Correct answer: This code will compile but crash.

Explanation: The removeLast() method returns the same data type as the array contains, which in this code is a String. As the only string in the array was already removed, the second call will throw an exception and crash.
*/

////////////////////////////////////////////////////////////
// Result
let result = Result { try String(contentsOfFile: pathToFileThatDoesNotExist) }
/*
Correct answer: .failure(Error).

Explanation: This uses a Result initializer that accepts a throwing function. In this instance, the function call will throw an error, causing result to be set to .failure with an Error value saying that the filename is invalid.
*/
