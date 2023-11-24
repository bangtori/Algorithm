import Foundation
class Node {
    var up: Node?
    var down: Node?
    var index: Int
    init(up: Node?, down: Node?, index: Int) {
        self.up = up
        self.down = down
        self.index = index
    }
}
func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var result = Array(repeating: "O", count: n)
    var linkedList = [Node]()
    for i in 0..<n {
        linkedList.append(Node(up: nil, down: nil, index: i))
    }
    linkedList[0].down = linkedList[1]
    for i in 1..<n-1 {
        linkedList[i].up = linkedList[i-1]
        linkedList[i].down = linkedList[i+1]
    }
    linkedList[n-1].up = linkedList[n-2]
    
    var cursor = linkedList[k]
    var deleteStack: [Node] = []
    
    for c in cmd {
        let cArr = c.components(separatedBy: " ")
        switch c.first {
        case "U":
            for _ in 1...Int(cArr[1])! {
                cursor = cursor.up!
            }
        case "D":
            for _ in 1...Int(cArr[1])! {
                cursor = cursor.down!
            }
        case "C":
            result[cursor.index] = "X"
            deleteStack.append(cursor)
            cursor.down?.up = cursor.up
            cursor.up?.down = cursor.down
            if cursor.down != nil {
                cursor = cursor.down!
            } else {
                cursor = cursor.up!
            }
        case "Z":
            let restore = deleteStack.removeLast()
            result[restore.index] = "O"
            restore.up?.down = restore
            restore.down?.up = restore
        default: break
        }
    }
    return result.joined(separator: "")
}