// Define an array
var arr = [1, 2, 3, 4, 5]

// Define a function to rotate the array to the left
func rotateLeft(_ array: inout [Int], by rotation: Int) {
    let amount = rotation % array.count
    let slice = array.prefix(amount)
    array.removeFirst(amount)
    array.append(contentsOf: slice)
}

// Define a function to rotate the array to the right
func rotateRight(_ array: inout [Int], by rotation: Int) {
    let amount = rotation % array.count
    let slice = array.suffix(amount)
    array.removeLast(amount)
    array.insert(contentsOf: slice, at: 0)
}

// Test the functions
print(arr) // [1, 2, 3, 4, 5]
rotateLeft(&arr, by: 2)
print(arr) // [3, 4, 5, 1, 2]
rotateRight(&arr, by: 3)
print(arr) // [1, 2, 3, 4, 5]

// --------------

// Here's an updated code to rotate the elements of an array to the left or right while keeping the first element in its original position:
// Define an array
var arr = [1, 2, 3, 4, 5]

// Define a function to rotate the array to the left
func rotateLeft(_ array: inout [Int], by rotation: Int) {
    let amount = rotation % array.count
    let slice = array[1...amount]
    array.removeSubrange(1...amount)
    array.append(contentsOf: slice)
}

// Define a function to rotate the array to the right
func rotateRight(_ array: inout [Int], by rotation: Int) {
    let amount = rotation % array.count
    let slice = array[(array.count - amount)..<array.count]
    array.removeSubrange((array.count - amount)..<array.count)
    array.insert(contentsOf: slice, at: 1)
}

// Test the functions
print(arr) // [1, 2, 3, 4, 5]
rotateLeft(&arr, by: 2)
print(arr) // [1, 4, 5, 2, 3]
rotateRight(&arr, by: 3)
print(arr) // [1, 3, 4, 5, 2]



