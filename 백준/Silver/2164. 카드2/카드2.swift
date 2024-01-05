struct Queue {
    var array: [Int]
    var index: Int = 0
    
    init(n: Int) {
        array = [Int](1...n)
    }
    
    var size: Int {
        return array.count - index
    }
    
    var isEmpty: Bool {
        return array.count - index <= 0
    }

    mutating func push(_ element: Int) {
        array.append(element)
    }

    mutating func pop() -> Int? {
        guard !self.isEmpty else {
            return nil
        }
        let element = array[index]
        index += 1
        return element
    }
}
let n = Int(readLine()!)!
var queue = Queue(n: n)

while queue.size > 1 {
    queue.pop()
    if let pop = queue.pop() {
        queue.push(pop)
    }
}
print(queue.array.last!)