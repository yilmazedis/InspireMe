indirect enum StateCase {
    case on(Int)
    case off(Int)
    case other(StateCase)
}


let state = StateCase.other(StateCase.other(StateCase.off(10)))

// An Example
/*

In Swift, the indirect keyword is used to indicate that a particular enumeration case should be "indirect," meaning that it can refer to another case of the same enumeration type.

*/

indirect enum LinkedListNode {
    case head(value: Int, node: LinkedListNode)
    case tail(value: Int)
    case node(value: Int, next: LinkedListNode)
}

let tail = LinkedListNode.tail(value: 5)
let nodes = LinkedListNode.node(value: 2,
                                next: LinkedListNode.node(value: 3,
                                next: LinkedListNode.node(value: 4,
                                next: tail)))

let head = LinkedListNode.head(value: 1, node: nodes)

// or

let head = LinkedListNode.head(value: 1, node: LinkedListNode.node(value: 2,
                                                                   next: LinkedListNode.node(value: 2,
                                                                   next: LinkedListNode.node(value: 3,
                                                                   next: LinkedListNode.tail(value: 5)))))


// Another Example

indirect enum BinaryTree {
    case leaf
    case node(left: BinaryTree, right: BinaryTree)
}

// or

indirect enum BinaryTree {
    case leaf(value: Int)
    case node(left: BinaryTree, right: BinaryTree)
}

let leftSubtree = BinaryTree.node(left: .leaf(value: 3), right: .leaf(value: 4))
let tree = BinaryTree.node(left: leftSubtree, right: .leaf(value: 5))

// Usage
func updateLeaf(in tree: BinaryTree, with value: Int) -> BinaryTree {
    switch tree {
    case .leaf:
        return .leaf(value: value)
    case let .node(left, right):
        return .node(left: updateLeaf(in: left, with: value), right: updateLeaf(in: right, with: value))
    }
}

let updatedTree = updateLeaf(in: tree, with: 10)

// Another usage
// Here's an example of how you could update the leaf nodes of the binary tree to have an increasing value by 1:

func updateLeaf(in tree: BinaryTree, startingValue: Int) -> BinaryTree {
    switch tree {
    case .leaf:
        return .leaf(value: startingValue)
    case let .node(left, right):
        return .node(left: updateLeaf(in: left, startingValue: startingValue + 1), right: updateLeaf(in: right, startingValue: startingValue + 1))
    }
}

/*

The function takes in two parameters, the tree and a starting value. It uses a recursive approach, where it checks the current node's case. If the current node is a leaf node, it returns a new leaf node with the updated value. If the current node is an internal node, it recursively calls the function on the left and right children, passing in an incremented value as the starting value.

You can call the function to update all leaf nodes in the tree with an increasing value by 1, for example:

*/

let updatedTree = updateLeaf(in: tree, startingValue: 1)

// This will update all leaf nodes in the tree to have increasing values starting from 1.

// Here's an example of how you could write a function to print the values of the leaf nodes in a binary tree:
func printLeafValues(in tree: BinaryTree) {
    switch tree {
    case let .leaf(value):
        print(value)
    case let .node(left, right):
        printLeafValues(in: left)
        printLeafValues(in: right)
    }
}

//Indirect enum
if case BinaryTree.leaf(let result) = updatedTree {
    print("Previous Result: \(result)")
}


/*

This function also uses a recursive approach. It checks the current node's case. If the current node is a leaf node, it prints the value of the node. If the current node is an internal node, it recursively calls the function on the left and right children. This way the function will visit all the leaf nodes in the tree and print their values.

*/

printLeafValues(in: tree)

