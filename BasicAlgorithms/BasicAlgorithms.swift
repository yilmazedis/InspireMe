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

In Swift, the ~= operator is known as the "pattern matching operator." It is used to check if a value matches a pattern.

Here's an example of how the ~= operator can be used:


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
