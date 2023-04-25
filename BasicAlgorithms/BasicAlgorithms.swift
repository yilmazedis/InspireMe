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
