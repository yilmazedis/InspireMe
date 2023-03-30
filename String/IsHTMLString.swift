private func isHTMLString(_ string: String) -> Bool {
    let htmlTagRegex = try! NSRegularExpression(pattern: "<[^>]+>")
    let range = NSRange(location: 0, length: string.utf16.count)
    return htmlTagRegex.firstMatch(in: string, range: range) != nil
}

let string1 = "<p>Hello, World!</p>"
let string2 = "Hello, World!"

print(isHTMLString(string1)) // true
print(isHTMLString(string2)) // false
