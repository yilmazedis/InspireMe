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
