// Example 1: Class with Subscript
class MyClass {
    private var data: [String: Int] = [:]
    
    subscript(key: String) -> Int? {
        get {
            return data[key]
        }
        set(newValue) {
            data[key] = newValue
        }
    }
}

// Example 2: Struct with Subscript
struct MyStruct {
    private var data: [Int] = []
    
    subscript(index: Int) -> Int {
        get {
            return data[index]
        }
        set(newValue) {
            if index < data.count {
                data[index] = newValue
            } else {
                data.append(newValue)
            }
        }
    }
}
