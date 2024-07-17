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

    var isEmpty: Bool {
        return head == nil
    }

    var peek: T? {
        return head?.value
    }

    func enqueue(_ value: T) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }

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

let len = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (len[0], len[1])
var map = [[Int]]()

for _ in 1...n {
    map.append(Array(readLine()!).map { Int(String($0))! })
}

var visited = [[[Bool]]](repeating: [[Bool]](repeating: [false, false], count: m), count: n) // (방문여부[벽을 부순 경우, 벽을 부수지 않은 경우])
let moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]

func bfs() -> Int {
    let queue = Queue<[Int]>()
    queue.enqueue([0, 0, 1, 0]) // (x, y, 거리, 벽을 부쉈는지 여부)
    visited[0][0][0] = true

    while !queue.isEmpty {
        let current = queue.dequeue()!
        let x = current[0]
        let y = current[1]
        let dist = current[2]
        let broken = current[3]

        if x == m - 1 && y == n - 1 {
            return dist
        }

        for move in moves {
            let nx = x + move.0
            let ny = y + move.1

            if 0..<m ~= nx && 0..<n ~= ny {
                if map[ny][nx] == 0 && !visited[ny][nx][broken] {
                    queue.enqueue([nx, ny, dist + 1, broken])
                    visited[ny][nx][broken] = true
                } else if map[ny][nx] == 1 && broken == 0 && !visited[ny][nx][1] {
                    queue.enqueue([nx, ny, dist + 1, 1])
                    visited[ny][nx][1] = true
                }
            }
        }
    }

    return -1
}

print(bfs())
