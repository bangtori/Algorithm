import Foundation

struct Heap<Element: Equatable> {
    var elements: [Element]
    let priorityFunction: (Element, Element) -> Bool
    
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: elements.count - 1)
    }
    
    mutating func dequeue() -> Element? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }
        return element
    }
    
    mutating func siftUp(elementAtIndex index: Int) {
        let parent = self.parentIndex(ofIndex: index)
        guard !isRoot(index),
              isHigherPriority(at: index, than: parent) else { return }
        elements.swapAt(index, parent)
        siftUp(elementAtIndex: parent)
    }
    
    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex { return }
        elements.swapAt(index, childIndex)
        siftDown(elementAtIndex: childIndex)
    }
    
    func isRoot(_ index: Int) -> Bool {
        return (index == 0)
    }
    
    func leftChildIndex(ofIndex index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(ofIndex index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(ofIndex index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        let leftChild = leftChildIndex(ofIndex: parent)
        let rightChild = rightChildIndex(ofIndex: parent)
        var highest = parent
        if leftChild < count && isHigherPriority(at: leftChild, than: highest) {
            highest = leftChild
        }
        if rightChild < count && isHigherPriority(at: rightChild, than: highest) {
            highest = rightChild
        }
        return highest
    }
}

struct Node: Equatable {
    let vertex: Int
    let distance: Int
}


let input = readLine()!.split(separator: " ").map{Int($0)!}
let (v, e) = (input[0], input[1])
let start = Int(readLine()!)!
var graph = [Int: [Node]]()
for _ in 1...e {
    let relationship = readLine()!.split(separator: " ").map{Int($0)!}
    if graph[relationship[0]]  == nil {
        graph[relationship[0]] = [Node(vertex: relationship[1], distance: relationship[2])]
    } else {
        graph[relationship[0]]?.append(Node(vertex: relationship[1], distance: relationship[2]))
    }
}
let initialValue = Int.max
var distances = [Int](repeating: initialValue, count: v + 1)
distances[start] = 0
var queue = Heap<Node> {
    $0.distance < $1.distance
}
queue.enqueue(Node(vertex: start, distance: 0))
while let node = queue.dequeue() {
    if let nexts = graph[node.vertex] {
        for next in nexts {
            let dist = node.distance + next.distance
            if distances[next.vertex] > dist {
                distances[next.vertex] = dist
                queue.enqueue(Node(vertex: next.vertex, distance: dist))
            }
        }
    }
}

for i in 1...v {
    if distances[i] == Int.max {
        print("INF")
    } else {
        print(distances[i])
    }
}