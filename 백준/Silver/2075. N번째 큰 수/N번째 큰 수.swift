import Foundation

struct MinHeap {
    private var heap: [Int] = []

    var size: Int {
        return heap.count
    }

    var isEmpty: Bool {
        return heap.isEmpty
    }

    mutating func insert(_ value: Int) {
        heap.append(value)
        siftUp(from: heap.count - 1)
    }

    mutating func removeMin() -> Int? {
        guard !heap.isEmpty else {
            return nil
        }
        if heap.count == 1 {
            return heap.removeLast()
        }

        let rootValue = heap[0]
        heap[0] = heap.removeLast()
        siftDown(from: 0)
        return rootValue
    }

    func getMin() -> Int? {
        return heap.first
    }

    private mutating func siftUp(from index: Int) {
        var childIndex = index
        let childValue = heap[childIndex]
        var parentIndex = (childIndex - 1) / 2

        while childIndex > 0 && heap[parentIndex] > childValue {
            heap[childIndex] = heap[parentIndex]
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
        heap[childIndex] = childValue
    }

    private mutating func siftDown(from index: Int) {
        var parentIndex = index
        let count = heap.count

        while true {
            let leftIndex = 2 * parentIndex + 1
            let rightIndex = 2 * parentIndex + 2
            var minIndex = parentIndex

            if leftIndex < count && heap[leftIndex] < heap[minIndex] {
                minIndex = leftIndex
            }
            if rightIndex < count && heap[rightIndex] < heap[minIndex] {
                minIndex = rightIndex
            }
            if minIndex == parentIndex {
                return
            }
            heap.swapAt(parentIndex, minIndex)
            parentIndex = minIndex
        }
    }
}


var minHeap = MinHeap()
let n = Int(readLine()!)!
for _ in 1...n {
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    for number in numbers {
        if minHeap.size < n {
            minHeap.insert(number)
        } else if let minValue = minHeap.getMin(), number > minValue {
            _ = minHeap.removeMin()
            minHeap.insert(number)
        }
    }
}

if let nthLargest = minHeap.getMin() {
    print(nthLargest)
}
