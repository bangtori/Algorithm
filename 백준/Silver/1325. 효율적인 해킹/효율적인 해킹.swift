import Foundation

struct Queue<T> {
    var pushStack = [T]()
    var popStack = [T]()
    var isEmpty: Bool {
        return pushStack.isEmpty && popStack.isEmpty
    }
    var count: Int {
        return pushStack.count + popStack.count
    }

    mutating func enqueue(_ element: T) {
        pushStack.append(element)
    }

    mutating func dequeue() -> T? {
        if popStack.isEmpty {
            while let popped = pushStack.popLast() {
                popStack.append(popped)
            }
        }
        return popStack.popLast()
    }
}

func answer() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0]
    let m = nm[1]
    var childs = [[UInt16]]()
    for _ in 0..<n+1 {
        childs.append([])
    }
    var maxHackCount = -1
    var canHackCount: [UInt16] = Array(repeating: 0, count: n+1)

    for _ in 0..<m {
        let temp = readLine()!.split(separator: " ").map { Int($0)! }
        childs[temp[1]].append(UInt16(temp[0]))
    }

    for i in 1..<n+1 {
        var visited = Array(repeating: false, count: n+1)
        var queue = Queue<UInt16>()
        visited[i] = true
        for child in childs[i] {
            if !visited[Int(child)] {
                queue.enqueue(UInt16(child))
                canHackCount[i] += 1
                visited[Int(child)] = true
            }
        }
        while let dequeued = queue.dequeue() {
            for child in childs[Int(dequeued)] {
                if !visited[Int(child)] {
                    queue.enqueue(child)
                    canHackCount[i] += 1
                    visited[Int(child)] = true
                }
            }
        }
        maxHackCount = max(maxHackCount, Int(canHackCount[i]))
    }

    for i in 0..<canHackCount.count where canHackCount[i] == maxHackCount {
        print("\(i)", terminator: " ")
    }
}

answer()