// @dynamicCallable

// func dynamicallyCall(withArguments args: ExpressibleByArrayLiteral) -> Double
// func dynamicallyCall(withKeywordArguments args: ExpressibleByDictionaryLiteral) -> Double

@dynamicCallable
struct RandomProvider {
    func dynamicallyCall(withArguments args: [Int]) -> Double {
        let numberOfZeroes = Double(args[0])
        let maximum = pow(10, numberOfZeroes)
        return Double.random(in: 0...maximum)
    }

    func dynamicallyCall(withKeywordArguments args: KeyValuePairs<String, Int>) -> Double {
        let numberOfZeroes = Double(args.first?.value ?? 0)
        let maximum = pow(10, numberOfZeroes)
        return Double.random(in: 0...maximum)
    }
}

let random = RandomProvider()
print(random(1)) // 8.15946134247
print(random(a:1)) // 5.14551692644
