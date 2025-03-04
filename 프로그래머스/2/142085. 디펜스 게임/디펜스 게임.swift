import Foundation
struct MinHeap<T: Comparable> {
    private var heap: [T] = []
    
    // 부모 노드 인덱스 찾기
    private func parentIndex(of index: Int) -> Int { (index - 1) / 2 }
    
    // 왼쪽 자식 노드 인덱스 찾기
    private func leftChildIndex(of index: Int) -> Int { 2 * index + 1 }
    
    // 오른쪽 자식 노드 인덱스 찾기
    private func rightChildIndex(of index: Int) -> Int { 2 * index + 2 }
    
    // 힙이 비었는지 확인
    var isEmpty: Bool { heap.isEmpty }
    
    // 힙의 크기 반환
    var count: Int { heap.count }
    
    // 최소값 반환 (삭제 안함)
    var peek: T? { heap.first }
    
    // 요소 추가 (삽입 후 최소 힙 유지)
    mutating func insert(_ value: T) {
        heap.append(value)
        heapifyUp(from: heap.count - 1)
    }
    
    // 최소값 제거 및 반환 (힙 유지)
    mutating func remove() -> T? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 { return heap.removeFirst() }
        
        let minValue = heap.first
        heap[0] = heap.removeLast()
        heapifyDown(from: 0)
        
        return minValue
    }
    
    // 힙 속성 유지 (삽입 후 위로 이동)
    private mutating func heapifyUp(from index: Int) {
        var childIndex = index
        let childValue = heap[childIndex]
        
        while childIndex > 0 {
            let parentIndex = self.parentIndex(of: childIndex)
            if heap[parentIndex] <= childValue { break }
            
            heap[childIndex] = heap[parentIndex]  // 부모를 아래로 이동
            childIndex = parentIndex
        }
        
        heap[childIndex] = childValue
    }
    
    // 힙 속성 유지 (삭제 후 아래로 이동)
    private mutating func heapifyDown(from index: Int) {
        var parentIndex = index
        let count = heap.count
        
        while true {
            let leftIndex = leftChildIndex(of: parentIndex)
            let rightIndex = rightChildIndex(of: parentIndex)
            var smallestIndex = parentIndex
            
            if leftIndex < count, heap[leftIndex] < heap[smallestIndex] {
                smallestIndex = leftIndex
            }
            
            if rightIndex < count, heap[rightIndex] < heap[smallestIndex] {
                smallestIndex = rightIndex
            }
            
            if smallestIndex == parentIndex { break }
            
            heap.swapAt(parentIndex, smallestIndex)
            parentIndex = smallestIndex
        }
    }
}
func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var n = n
    var heap = MinHeap<Int>()
    for i in 0..<enemy.count {
        heap.insert(enemy[i])
        if heap.count > k {
            let min = heap.remove()!
            if n < min {
                return i
            }
            n -= min
        }
    }
    return enemy.count
}