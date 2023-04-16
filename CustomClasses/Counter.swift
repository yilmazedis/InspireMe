//: [Previous](@previous)

import Foundation
import XCTest

struct Counter: CustomStringConvertible, Equatable {
    
    private var count: Int = 0
    
    var description: String {
        return String(count)
    }
    
    init(_ count: Int) {
        self.count = count
    }
    
    mutating func increment() {
        count += 1
    }
    
    mutating func decrement() {
        count -= 1
    }
    
    static func +(lhs: Counter, rhs: Counter) -> Counter {
        return Counter(lhs.count + rhs.count)
    }
    
    static func -(lhs: Counter, rhs: Counter) -> Counter {
        return Counter(lhs.count - rhs.count)
    }
    
    static func +=(lhs: inout Counter, rhs: Counter) {
        lhs.count += rhs.count
    }
    
    static func -=(lhs: inout Counter, rhs: Counter) {
        lhs.count -= rhs.count
    }
}

extension Counter: ExpressibleByIntegerLiteral {
    init(integerLiteral value: Int) {
        self.init(value)
    }
}

var counter1 = Counter(2)
var counter2 = Counter(1)
var counter3: Counter = 10

counter2.increment()
counter2.increment()
counter1.increment()

counter1.decrement()

counter1 = counter2 + counter1
counter1 += counter3

counter3 -= counter2
counter1 -= 2

counter2 - 13
counter1 + 10

print(counter1)

class CounterTests: XCTestCase {
    
    func testIncrement() {
        var counter = Counter(0)
        counter.increment()
        XCTAssertEqual(counter, 1)
        counter.increment()
        XCTAssertEqual(counter, 2)
    }
    
    func testDecrement() {
        var counter = Counter(0)
        counter.decrement()
        XCTAssertEqual(counter, -1)
        counter.decrement()
        XCTAssertEqual(counter, -2)
    }
    
    func testAddition() {
        let counter1 = Counter(5)
        let counter2 = Counter(7)
        let result = counter1 + counter2
        XCTAssertEqual(result, 12)
        
        let result2 = result + 3
        XCTAssertEqual(result2, 15)
    }
    
    func testSubtraction() {
        let counter1 = Counter(10)
        let counter2 = Counter(7)
        let result = counter1 - counter2
        XCTAssertEqual(result, 3)
        
        let result2 = result - 3
        XCTAssertEqual(result2, 0)
    }
    
    func testAdditionAssignment() {
        var counter1 = Counter(5)
        let counter2 = Counter(7)
        counter1 += counter2
        XCTAssertEqual(counter1, 12)
        
        counter1 += 10
        XCTAssertEqual(counter1, 22)
    }
    
    func testSubtractionAssignment() {
        var counter1 = Counter(20)
        let counter2 = Counter(7)
        counter1 -= counter2
        XCTAssertEqual(counter1, 13)
        
        counter1 -= 5
        XCTAssertEqual(counter1, 8)
    }
    
    func testExpressibleByIntegerLiteral() {
        let counter: Counter = 10
        XCTAssertEqual(counter, 10)
    }
    
    func testCustomStringConvertible() {
        let counter = Counter(5)
        XCTAssertEqual(counter.description, "5")
        XCTAssertEqual(String(counter.description), "5")
        XCTAssertEqual("\(counter)", "5")
    }
}

CounterTests.defaultTestSuite.run()
