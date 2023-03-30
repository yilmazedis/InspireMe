
// MARK:- Way 1
func binaryStringSummation(b1: String, b2: String) -> String {
    
    let count = max(b1.count, b2.count)
    var in1 = b1.endIndex
    var in2 = b2.endIndex
    var carry = false
    
    var result = ""
    
    for _ in 0..<count {
        in1 = b1.index(before: in1)
        in2 = b2.index(before: in2)
        
        let el1 = b1[in1]
        let el2 = b2[in2]
        
        if el1 == "1" && el2 == "1" {
            if carry {
                result = "1" + result
            } else {
                result = "0" + result
            }
            carry = true
        } else if el1 == "1" || el2 == "1" {
            if carry {
                result = "0" + result
                carry = true
            } else {
                result = "1" + result
            }
        } else {
            if carry {
                result = "1" + result
                carry = false
            } else {
                result = "0" + result
            }
        }
    }
    
    if carry {
        result = "1" + result
    }
    
    return result
}

// MARK:- Way 2
func binaryStringSummation(b1: String, b2: String) -> String {
    var result = ""
    var carry = false
    
    for (el1, el2) in zip(b1.lazy.reversed(), b2.lazy.reversed()) {
        if el1 == "1" && el2 == "1" {
            if carry {
                result = "1" + result
            } else {
                result = "0" + result
            }
            carry = true
        } else if el1 == "1" || el2 == "1" {
            if carry {
                result = "0" + result
                carry = true
            } else {
                result = "1" + result
            }
        } else {
            if carry {
                result = "1" + result
                carry = false
            } else {
                result = "0" + result
            }
        }
    }
    
    if carry {
        result = "1" + result
    }
    
    return result
}

binaryStringSummation(b1: "1100110", b2: "1010111")
