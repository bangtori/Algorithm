import Foundation
struct MinHeap<T: Comparable> {
    enum downDirection {
        case right
        case left
        case stop
    }
    var heap: Array<T> = []

    init() {}
    init(data: T) {
        heap.append(data) // 0번 인덱스 버리기용
        heap.append(data)
    }

    mutating func insert(_ data: T) {
        if heap.isEmpty {
            heap.append(data) // 0번 인덱스 버리기용
            heap.append(data)
            return
        }

        heap.append(data)

        func isMove(_ index: Int) -> Bool {
            if index <= 1 {
                return false
            }
            let parentIndex = index / 2
            return heap[index] <= heap[parentIndex] ? true : false
        }

        var currentIndex = heap.count - 1
        while isMove(currentIndex) {
            let parentIndex = currentIndex / 2
            heap.swapAt(parentIndex, currentIndex)
            currentIndex = parentIndex
        }
    }

    mutating func pop() -> T? {
        if heap.count <= 1 {
            return nil
        }
        let returnData = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.popLast()

        func move(_ index: Int) -> downDirection {
            let leftIndex = index * 2
            let rightIndex = index * 2 + 1

            if leftIndex > heap.count - 1 {
                // 자식 노드가 없는 경우, 왼쪽 노드부터 채워지므로 왼쪽 노드가 범위를 벗어나면 자식 노드가 없는 경우임
                return .stop
            }

            if rightIndex > heap.count - 1 {
                // 왼쪽 자식 노드만 있고 오른쪽 자식 노드는 없는 경우 -> 왼쪽 자식 노드와 비교
                return heap[leftIndex] < heap[index] ? .left : .stop
            }

            if (heap[leftIndex] > heap[index]) && (heap[rightIndex] > heap[index]) {
                // 두 자식 요소가 모두 큰 경우 -> 조건 만족 이동 X
                return .stop
            }

            if (heap[leftIndex] < heap[index]) && (heap[rightIndex] < heap[index]) {
                // 두 자식 요소가 모두 작은 경우 -> 더 작은 자식노드와 교체
                return heap[leftIndex] < heap[rightIndex] ? .left : .right
            }

            // 위의 모든 경우의 수를 제외하면 두 자식 노드 하나만 작은 경우만 남음 -> left가 현재 노드보다 작다면 left만 작은 경우이고 아니라면 right만 작은 경우임
            if heap[leftIndex] < heap[index] || heap[rightIndex] < heap[index] {
                return heap[leftIndex] < heap[rightIndex] ? .left : .right
            }
            return .stop
        }

        var currentIndex = 1

        while true {
            switch move(currentIndex) {
            case .left:
                let leftIndex = currentIndex * 2
                heap.swapAt(currentIndex, leftIndex)
                currentIndex = leftIndex
            case .right:
                let rightIndex = currentIndex * 2 + 1
                heap.swapAt(currentIndex, rightIndex)
                currentIndex = rightIndex
            case .stop:
                return returnData
            }
        }
    }
}

let n = Int(readLine()!)!
var heap = MinHeap<Int>()
for _ in 1...n {
    let command = Int(readLine()!)!
    if command == 0 {
        if let popNum = heap.pop() {
            print(popNum)
        } else {
            print(0)
        }
    } else {
        heap.insert(command)
    }
}
