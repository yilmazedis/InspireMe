// Define a closure type that takes an integer parameter and returns void
typealias CompletionHandler = (Int) -> Void

// Function that takes a closure as a parameter
func fetchData(completion: @escaping CompletionHandler) {
    // Simulate fetching data asynchronously
    DispatchQueue.global().async {
        // Simulate data fetching completion
        let data = 42
        // Call the completion handler on the main queue
        DispatchQueue.main.async {
            completion(data)
        }
    }
}

// Call fetchData function with a closure
fetchData { result in
    print("Data fetched: \(result)")
}

/*
When a closure is marked as @escaping, it means that the closure can outlive the lifetime of the function it's passed to. 
In other words, it's stored for later execution. In this case, completion is called asynchronously after fetchData completes its execution.

In Swift, closures are non-escaping by default, 
which means they are executed within the function's scope and must complete before the function returns. 
However, in scenarios where the closure needs to be executed after the function returns (e.g., asynchronous operations like network requests), 
you must explicitly mark the closure as @escaping. This ensures that the closure captures and stores references to any variables it uses, 
preventing them from being deallocated before the closure is executed.
*/
