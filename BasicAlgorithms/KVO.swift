class MyClass: NSObject {
    @objc dynamic var myProperty: String = ""
}

class Observer: NSObject {
    var observedObject: MyClass
    
    init(observedObject: MyClass) {
        self.observedObject = observedObject
        super.init()
        
        observedObject.addObserver(self, forKeyPath: #keyPath(MyClass.myProperty), options: [.new, .old], context: nil)
    }
    
    deinit {
        observedObject.removeObserver(self, forKeyPath: #keyPath(MyClass.myProperty))
    }
    
    // This method will be called when the observed property changes
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(MyClass.myProperty) {
            if let newValue = change?[.newKey] as? String {
                print("New value: \(newValue)")
            }
        }
    }
}

let myObject = MyClass()
let observer = Observer(observedObject: myObject)

// Modify the property to trigger the observation
myObject.myProperty = "New Value"
