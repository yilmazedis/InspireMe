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
