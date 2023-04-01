var mySet = Set<Int>()
var mySet: Set<Int> = [1, 2, 3, 4, 5]

///
mySet.insert(6)

///
mySet.remove(3)
mySet.removeAll()

///
if mySet.contains(5) {
    print("Set contains 5")
}

for element in mySet {
    print(element)
}

///
let set1: Set<Int> = [1, 2, 3, 4]
let set2: Set<Int> = [3, 4, 5, 6]

///
let union = set1.union(set2) // {1, 2, 3, 4, 5, 6}
let intersection = set1.intersection(set2) // {3, 4}
let difference = set1.subtracting(set2) // {1, 2}

///
let count = mySet.count
let empty = mySet.isEmpty

///
let set1: Set<Int> = [1, 2, 3, 4]
let set2: Set<Int> = [3, 4, 5, 6]

let symDiff = set1.symmetricDifference(set2) // {1, 2, 5, 6}

///
let set1: Set<Int> = [1, 2, 3]
let set2: Set<Int> = [1, 2, 3, 4, 5]

let isSubset = set1.isSubset(of: set2) // true
let isSuperset = set2.isSuperset(of: set1) // true

///
let set1: Set<Int> = [1, 2, 3]
let set2: Set<Int> = [4, 5, 6]

let isDisjoint = set1.isDisjoint(with: set2) // true

///
let set1: Set<Int> = [1, 2, 3]
let set2: Set<Int> = [1, 2, 3]

let isEqual = set1 == set2 // true
let isNotEqual = set1 != set2 // false

///
let mySet: Set<Int> = [1, 2, 3, 4, 5]
let filteredSet = mySet.filter({ $0 % 2 == 0 }) // {2, 4}

///
let mySet: Set<Int> = [1, 2, 3, 4, 5]
let mappedSet = mySet.map({ $0 * 2 }) // {2, 4, 6, 8, 10}

///
let mySet: Set<Int> = [1, 2, 3, 4, 5]
let reducedValue = mySet.reduce(0, { $0 + $1 }) // 15

///
let mySet: Set<Int> = [5, 1, 4, 2, 3]
let sortedSet = mySet.sorted(by: { $0 < $1 }) // [1, 2, 3, 4, 5]

///
let mySet: Set<Int> = [1, 2, 3, 4, 5]
let element = mySet[mySet.index(mySet.startIndex, offsetBy: 2)] // 3

///
let mySet: Set<Int> = [1, 2, 3, 4, 5]

let hasElement = mySet.contains(3) // true
let isEqual = mySet == [1, 2, 3, 4, 5] // true

///
var set1: Set<Int> = [1, 2, 3, 4]
let set2: Set<Int> = [3, 4, 5, 6]

set1.formSymmetricDifference(set2)
print(set1) 
