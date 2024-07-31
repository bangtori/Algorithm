let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n ,m) = (input[0], input[1])
let removeList = readLine()!.split(separator: " ").map{Int($0)!}

class Queue {
    var head = 1
    var queue = [Int]()
    init(len: Int){
        for i in 0...len {
            queue.append(i)
        }
    }
    var isEmpty: Bool {
        return queue.filter{$0 != 0}.count == 0
    }
    func moveNext() {
        repeat {
            head = head + 1 == queue.count ? 1 : head + 1
        } while queue[head] == 0
    }
    
    func movePrevious() {
        repeat {
            head = head - 1 == 0 ? queue.count-1 : head - 1
        } while queue[head] == 0
    }
    
    func remove(value: Int) -> Int {
        let start = head
        var nextCount = 0
        var prevCount = 0
        while head != value {
            moveNext()
            nextCount += 1
        }
        
        head = start
        while head != value {
            movePrevious()
            prevCount += 1
        }
        queue[value] = 0
        if !isEmpty {
            moveNext()
        }
        if prevCount < nextCount {
            return prevCount
        } else {
            return nextCount
        }
    }
}

var queue = Queue(len: n)
var count = 0
for element in removeList {
    count += queue.remove(value: element)
}

print(count)
