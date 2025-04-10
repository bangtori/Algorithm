import Foundation

struct Process: Comparable {
    let id: Int
    let requestTime: Int
    let duration: Int
    
    static func < (lhs: Process, rhs: Process) -> Bool {
        if lhs.duration == rhs.duration {
            if lhs.requestTime == rhs.requestTime {
                return lhs.id < rhs.id
            }
            return lhs.requestTime < rhs.requestTime
        }
        return lhs.duration < rhs.duration
    }
}

struct ProcessHeap {
    private var heap: [Process] = []
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    mutating func push(_ process: Process) {
        heap.append(process)
        shiftUp(index: heap.count - 1)
    }
    
    mutating func pop() -> Process? {
        guard !heap.isEmpty else { return nil }
        
        if heap.count == 1 {
            return heap.removeFirst()
        }
        
        heap.swapAt(0, heap.count - 1)
        let root = heap.removeLast()
        shiftDown(index: 0)
        return root
    }
    
    private mutating func shiftUp(index: Int) {
        var childIndex = index
        let child = heap[childIndex]
        
        while childIndex > 0 {
            let parentIndex = (childIndex - 1) / 2
            let parent = heap[parentIndex]
            
            if child >= parent { break }

            heap[childIndex] = parent
            childIndex = parentIndex
        }
        
        heap[childIndex] = child
    }
    
    private mutating func shiftDown(index: Int) {
        var parentIndex = index
        let count = heap.count
        
        while true {
            let left = 2 * parentIndex + 1
            let right = 2 * parentIndex + 2
            var minIndex = parentIndex
            
            if left < count && heap[left] < heap[minIndex] {
                minIndex = left
            }
            
            if right < count && heap[right] < heap[minIndex] {
                minIndex = right
            }
            
            if minIndex == parentIndex { break }
            
            heap.swapAt(parentIndex, minIndex)
            parentIndex = minIndex
        }
    }
}

func solution(_ jobs:[[Int]]) -> Int {
    let count = jobs.count
    var jobs = jobs.enumerated().map { i, data in
        return Process(id: i, requestTime: data[0], duration: data[1])
    }.sorted { p1, p2 in
        return p1.requestTime < p2.requestTime
    }
    
    var endTime: [Int] = jobs.map { -1 * $0.requestTime }
    var time = 0
    var queue = ProcessHeap()
    var currentProcess: (Process, Int)?
    
    while !(jobs.isEmpty && queue.isEmpty && currentProcess == nil) {
        while !jobs.isEmpty, jobs[0].requestTime == time {
            let job = jobs.removeFirst()
            queue.push(job)
        }
        if currentProcess == nil {
            if let newProcess = queue.pop() {
                currentProcess = (newProcess, 0)
            }
        } else {
            currentProcess!.1 += 1
        }
        
        if currentProcess != nil {
            if currentProcess!.1 == currentProcess!.0.duration {
                endTime[currentProcess!.0.id] += time
                currentProcess = nil
                if let newProcess = queue.pop() {
                    currentProcess = (newProcess, 0)
                }
            }
        }
        
        time += 1
    }
    
    return endTime.reduce(0, +) / count
}