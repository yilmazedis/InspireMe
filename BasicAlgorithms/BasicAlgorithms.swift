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

