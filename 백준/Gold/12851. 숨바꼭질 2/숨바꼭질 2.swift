class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
        self.next = nil
    }
}
class Queue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    // Queue가 비어 있는지 확인하는 메서드
    var isEmpty: Bool {
        return head == nil
    }
    
    // Queue의 앞에 있는 요소를 반환하는 메서드
    var peek: T? {
        return head?.value
    }
    
    // 요소를 Queue의 끝에 추가하는 메서드
    func enqueue(_ value: T) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    // Queue의 앞에 있는 요소를 제거하고 반환하는 메서드
    func dequeue() -> T? {
        if let headNode = head {
            head = headNode.next
            if head == nil {
                tail = nil
            }
            return headNode.value
        }
        return nil
    }
}

let positions = readLine()!.split(separator: " ").map{Int($0)!}
let (n, k) = (positions[0], positions[1])

var resultCount = 0
var minCount = [Int](repeating: Int.max, count: 100001)
var visited = [Bool](repeating: false, count: 100001)
func bfs(start: Int) {
    var queue = Queue<(position: Int, count: Int)>()
    queue.enqueue((start, 0))
    
    while !queue.isEmpty {
        guard let current = queue.dequeue() else { break }
        if minCount[k] < current.count {
            // 이미 k의 찾는 경우의 수보다 넘침 -> 굳이 탐색 x
            break
        }
        
        if current.position == k {
            // 넘치는 경우는 이미 제외했으므로 비교 안해도됨
            minCount[k] = current.count
            resultCount += 1
        }
        
        let moves = [current.position * 2, current.position + 1, current.position - 1]
        for move in moves {
            if 0..<minCount.count ~= move {
                if !visited[move] || minCount[move] >= current.count + 1 {
                    visited[move] = true
                    minCount[move] = current.count + 1
                    queue.enqueue((move, current.count + 1))
                }
            }
        }
    }
}

bfs(start: n)

print(minCount[k])
print(resultCount)
