struct Node {
    let left: String
    let right: String
}

let n = Int(readLine()!)!
var tree: [String: Node] = [:]

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{String($0)}
    tree[input[0]] = Node(left: input[1], right: input[2])
}

// 전위 순회
func preorder(_ start: String) {
    if start == "." {
        return
    }
    print(start, terminator: "")
    preorder(tree[start]!.left)
    preorder(tree[start]!.right)
}
// 중위 순회
func inorder(_ start: String) {
    if start == "." {
        return
    }
    inorder(tree[start]!.left)
    print(start, terminator: "")
    inorder(tree[start]!.right)
}
// 후위 순회
func postorder(_ start: String) {
    if start == "." {
        return
    }
    postorder(tree[start]!.left)
    postorder(tree[start]!.right)
    print(start, terminator: "")
}

preorder("A")
print()
inorder("A")
print()
postorder("A")