import Foundation

class TwoStackQueue<T> {
    private var inputStack: [T] = []   // 입력 스택
    private var outputStack: [T] = []  // 출력 스택
    
    // 배열을 통해 큐를 초기화하는 init 메서드
    init(_ elements: [T] = []) {
        inputStack = elements
    }
    
    // 큐에 요소를 추가 (O(1))
    func enqueue(_ value: T) {
        inputStack.append(value)
    }
    
    // 큐에서 요소를 제거하고 반환 (필요할 때 O(n), 그 외 O(1))
    func dequeue() -> T? {
        if outputStack.isEmpty {
            // outputStack이 비어 있으면 inputStack의 모든 요소를 옮겨준다
            while !inputStack.isEmpty {
                outputStack.append(inputStack.removeLast())
            }
        }
        return outputStack.popLast()
    }
    
    // 큐에서 첫 번째 요소를 확인 (O(1), 필요시 O(n))
    func peek() -> T? {
        if outputStack.isEmpty {
            while !inputStack.isEmpty {
                outputStack.append(inputStack.removeLast())
            }
        }
        return outputStack.last
    }
    
    // 큐가 비었는지 확인 (O(1))
    func isEmpty() -> Bool {
        return inputStack.isEmpty && outputStack.isEmpty
    }
    
    // 큐의 크기 확인 (O(1))
    func count() -> Int {
        return inputStack.count + outputStack.count
    }
}
func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var target = (queue1.reduce(0, { $0+$1 }) + queue2.reduce(0, { $0+$1 })) / 2
    var sumQ1 = queue1.reduce(0, +)
    var maxTry = queue1.count * 3
    var currentCount = 0
    var q1 = TwoStackQueue<Int>(queue1)
    var q2 = TwoStackQueue<Int>(queue2)
    
    while currentCount <= maxTry {
        if sumQ1 == target {
            return currentCount
        } else if sumQ1 < target {
            if let pop = q2.dequeue() {
                q1.enqueue(pop)
                sumQ1 += pop
            } else {
                return -1
            }
        } else {
            if let pop = q1.dequeue() {
                q2.enqueue(pop)
                sumQ1 -= pop
            } else {
                return -1
            }
        }
        
        currentCount += 1
    }
    
    return -1
}
