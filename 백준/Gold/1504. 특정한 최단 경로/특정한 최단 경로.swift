import Foundation

struct Edge {
    let to: Int
    let weight: Int
}

struct PriorityQueue<T: Comparable> {
    private var heap: [T] = []
    private let ordered: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.ordered = sort
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    var count: Int {
        return heap.count
    }
    
    mutating func push(_ element: T) {
        heap.append(element)
        siftUp(from: heap.count - 1)
    }
    
    mutating func pop() -> T? {
        if heap.isEmpty {
            return nil
        }
        if heap.count == 1 {
            return heap.removeLast()
        }
        heap.swapAt(0, heap.count - 1)
        defer {
            siftDown(from: 0)
        }
        return heap.removeLast()
    }
    
    private mutating func siftUp(from index: Int) {
        var childIndex = index
        let child = heap[childIndex]
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && ordered(child, heap[parentIndex]) {
            heap[childIndex] = heap[parentIndex]
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
        heap[childIndex] = child
    }
    
    private mutating func siftDown(from index: Int) {
        var parentIndex = index
        let count = heap.count
        
        while true {
            let leftChildIndex = 2 * parentIndex + 1
            let rightChildIndex = 2 * parentIndex + 2
            var candidateIndex = parentIndex
            
            if leftChildIndex < count && ordered(heap[leftChildIndex], heap[candidateIndex]) {
                candidateIndex = leftChildIndex
            }
            if rightChildIndex < count && ordered(heap[rightChildIndex], heap[candidateIndex]) {
                candidateIndex = rightChildIndex
            }
            if candidateIndex == parentIndex {
                return
            }
            heap.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}

struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.dist < rhs.dist
    }
    
    let edge: Int
    let dist: Int
}

func dijkstra(start: Int, graph: [[Edge]], distances: inout [Int]) {
    var priorityQueue = PriorityQueue<Node>(sort: { $0 < $1 })
    distances[start] = 0
    priorityQueue.push(Node(edge: start, dist: 0))
    
    while !priorityQueue.isEmpty {
        guard let current = priorityQueue.pop() else { break }
        let currentNode = current.edge
        let currentDist = current.dist
        
        if distances[currentNode] < currentDist {
            continue
        }
        
        for edge in graph[currentNode] {
            let newDistance = currentDist + edge.weight
            if newDistance < distances[edge.to] {
                distances[edge.to] = newDistance
                priorityQueue.push(Node(edge: edge.to, dist: newDistance))
            }
        }
    }
}

func solveShortestPathProblem() {
    let inf = 987654321
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0], e = input[1]
    
    var graph = [[Edge]](repeating: [], count: n + 1)
    
    for _ in 0..<e {
        let edgeInfo = readLine()!.split(separator: " ").map { Int($0)! }
        let u = edgeInfo[0], v = edgeInfo[1], w = edgeInfo[2]
        graph[u].append(Edge(to: v, weight: w))
        graph[v].append(Edge(to: u, weight: w))
    }
    
    let mustPass = readLine()!.split(separator: " ").map { Int($0)! }
    let v1 = mustPass[0], v2 = mustPass[1]
    
    func shortestPathVia(v1: Int, v2: Int) -> Int {
        var distFromStart = [Int](repeating: inf, count: n + 1)
        var distFromV1 = [Int](repeating: inf, count: n + 1)
        var distFromV2 = [Int](repeating: inf, count: n + 1)
        
        dijkstra(start: 1, graph: graph, distances: &distFromStart)
        dijkstra(start: v1, graph: graph, distances: &distFromV1)
        dijkstra(start: v2, graph: graph, distances: &distFromV2)
        
        let path1 = distFromStart[v1] + distFromV1[v2] + distFromV2[n]
        let path2 = distFromStart[v2] + distFromV2[v1] + distFromV1[n]
        
        let shortestPath = min(path1, path2)
        
        return shortestPath >= inf ? -1 : shortestPath
    }
    
    let result = shortestPathVia(v1: v1, v2: v2)
    print(result)
}

solveShortestPathProblem()
