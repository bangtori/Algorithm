import Foundation

struct HEAP<T: Equatable> {
    private var elements: [T] = []
    private let sort: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }

    var isEmpty: Bool { return elements.isEmpty }
    var count: Int { return elements.count }

    func peek() -> T? {
        return elements.first
    }

    mutating func insert(_ value: T) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }

    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let removed = elements.removeLast()
        siftDown(from: 0)
        return removed
    }

    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    private mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent

            if left < elements.count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < elements.count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

struct Node: Equatable {
    let vertex: Int
    let distance: Int
}

func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    var distances = [Int](repeating: Int.max, count: n+1)
    distances[destination] = 0
    var graph: [Int: [Int]] = [:]
    roads.forEach { info in
        let (a,b) = (info[0], info[1])
        graph[a, default: []].append(b)
        graph[b, default: []].append(a)
    }
    
    var queue = HEAP<Node>{
        $0.distance < $1.distance
    }
    
    queue.insert(Node(vertex: destination, distance: 0))
    
    while let node = queue.remove() {
        if distances[node.vertex] < node.distance { continue }
        for next in graph[node.vertex] ?? [] {
            let dist = node.distance + 1
            if distances[next] > dist {
                distances[next] = dist
                queue.insert(Node(vertex: next, distance: dist))
            }
        }
    }
    let result = sources.map { index in
        return distances[index] == Int.max ? -1 : distances[index]
    }
    return result
}