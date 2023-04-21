import XCTest

struct Stack {
    private var values: [Int]
    
    init() {
        self.values = []
    }
    
    init(_ stack: [Int]) {
        self.values = stack
    }
    
    /**
     Returns the number of elements in the stack
     
     Runtime Complexity
     Best: O(1)
     Worst: O(1)
     Average: O(1)
        
     Additional comments (if any):
     Runtime Complexity O(1) if the collection conforms to RandomAccessCollection; otherwise, O(n), where n is the length of the collection.
     */
    var count: Int {
        return values.count
    }
    
    /**
     Returns a Boolean value indicating whether the stack is empty
     
     Runtime Complexity
     Best: O(1)
     Worst: O(1)
     Average: O(1)
     */
    var isEmpty: Bool {
        return values.isEmpty
    }
    
    /**
     Adds the given value to the top of the stack
     
     Runtime Complexity
     Best: O(1)
     Worst: O(1)
     Average: O(1)
     */
    mutating func push(value: Int) {
        values.append(value)
    }

    /**
     Removes and returns the value of the top-most element
     
     Runtime Complexity
     Best: O(1)
     Worst: O(1)
     Average: O(1)
     
     Additional comments (if any):
     pop must return optinal in any nil case.
     */
    @discardableResult
    mutating func pop() -> Int? {
        return values.popLast()
    }

    /**
     Returns the value of the top-most element
     
     Runtime Complexity
     Best: O(1)
     Worst: O(1)
     Average: O(1)
     
     Additional comments (if any):
     peek must return optinal in any nil case.
     */
    func peek() -> Int? {
        return values.last
    }
    
    /**
     Returns a new stack that contains the elements of the original stack in reverse order
     
     Runtime Complexity
     Best: O(n)
     Worst: O(n)
     Average: O(n)
     */
    func reversed() -> Stack {
        Stack(values.reversed())
    }
    
    /**
     Removes all elements from the stack
     
     Runtime Complexity
     Best: O(1)
     Worst: O(n)
     Average: O(n)
     */
    mutating func clear() {
        values.removeAll()
    }
    
    /**
     Adds the given values to the top of the stack
     
     Runtime Complexity
     Best: O(n)
     Worst: O(n)
     Average: O(n)
     Additional comments (if any):
     n = rhs count of element
     */
    static func +(lhs: Stack, rhs: Stack) -> Stack {
        Stack(lhs.values + rhs.values)
    }
    
    /**
     Adds the given values to the top of the stack
     
     Runtime Complexity
     Best: O(n)
     Worst: O(n)
     Average: O(n)
     Additional comments (if any):
     n = rhs count of element
     */
    static func +=(lhs: inout Stack, rhs: Stack) {
        lhs.values.append(contentsOf: rhs.values)
    }
    
    // we can add -= and - operator overloads to pop multi element of stack
    // for example:
    // var stack: Stack = [1, 2, 3, 4, 5]
    // stack -= 2 // [1, 2, 3]
    // or
    // stack = stack - 3 // [1, 2]
    
    // According to demand, we also can overload += and + with Int to have alternative of push
    // for example:
    // static func +=(lhs: inout Stack, rhs: Stack) {
    //     lhs.values.append(rhs)
    // }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Int...) {
        self.init()
        for element in elements {
            self.push(value: element)
        }
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let elements = values.map { "\($0)" }.joined(separator: ", ")
        return "[\(elements)]"
    }
}

extension Stack: Equatable {
    static func == (lhs: Stack, rhs: Stack) -> Bool {
        return "\(lhs)" == "\(rhs)"
    }
}

class StackTests: XCTestCase {
    
    func testStack() {
        var stack = Stack([1, 2, 3, 4, 5])
        
        // is empty
        XCTAssertEqual(stack.isEmpty, false)
        
        // peak
        XCTAssertEqual(stack.peek(), 5)
        stack.push(value: 6)
        XCTAssertEqual(stack.peek(), 6)
        
        // pop and count
        XCTAssertEqual(stack.count, 6)
        XCTAssertEqual(stack.pop()!, 6)
        XCTAssertEqual(stack.count, 5)
        
        // add with +=
        stack += [21, 34, 56]
        XCTAssertEqual(stack.count, 8)
        XCTAssertEqual(stack, Stack([1, 2, 3, 4, 5, 21, 34, 56]))
        
        let stack2: Stack = [100, 120, 130]
        stack += stack2
        XCTAssertEqual(stack.count, 11)
        XCTAssertEqual(stack, Stack([1, 2, 3, 4, 5, 21, 34, 56, 100, 120, 130]))
        
        // add with +
        stack = stack + [140, 150]
        XCTAssertEqual(stack.count, 13)
        XCTAssertEqual(stack, Stack([1, 2, 3, 4, 5, 21, 34, 56, 100, 120, 130, 140, 150]))
        
        let stack3: Stack = [160, 170, 180]
        stack = stack + stack3
        XCTAssertEqual(stack.count, 16)
        XCTAssertEqual(stack, Stack([1, 2, 3, 4, 5, 21, 34, 56, 100, 120, 130, 140, 150, 160, 170, 180]))
        
        // is empty
        stack.clear()
        XCTAssertEqual(stack.isEmpty, true)
        var stack4 = Stack()
        XCTAssertEqual(stack4.isEmpty, true)
        
        stack4 += [1]
        XCTAssertEqual(stack4.isEmpty, false)
    }
    
    func testExpressibleByArrayLiteral() {
        let stack: Stack = [1, 2, 3, 4, 5]
        XCTAssertEqual(stack.description, "[1, 2, 3, 4, 5]")
        XCTAssertEqual("\(stack)", "[1, 2, 3, 4, 5]")
        
        let reversed = stack.reversed()
        XCTAssertEqual("\(reversed)", "[5, 4, 3, 2, 1]")
    }
}

// I may not cover all cases. Just want to show how can we improve our own Structures & Algorithm.
// I hope I didn't misunderstand about this case demand. I thought, what kind of stack I would like to have, then I did this.
// I converted Stack class to struct. Converting the Stack class to a struct has its advantages and disadvantages.
// Advantages include value semantics, enforcing immutability, and simpler syntax.
// Disadvantages include no inheritance, no deinitializers, and copying overhead.
// So, the choice between a struct and a class depends on the specific needs of your program
StackTests.defaultTestSuite.run()

// Run it in playground and make sure Xcode does not work on Rosetta
