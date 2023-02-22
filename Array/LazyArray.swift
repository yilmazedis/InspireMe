let numbers = Array(1...100000)

let lazySquares = numbers.lazy.map { $0 * $0 }

/// Just call index 3.
print(lazySquares[3])
