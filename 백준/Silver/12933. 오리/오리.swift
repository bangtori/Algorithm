import Foundation


let input = readLine()!
var lists = [[Int]]()
let quack: [Character: Int] = ["q": 0, "u": 1, "a": 2, "c": 3, "k": 4]
var flag = true

input.forEach {
    guard let ch = quack[$0] else {
        flag = false
        return
    }
    
    var isInsert = false
    for i in 0..<lists.count {
        if lists[i].last! == (ch == 0 ? 4 : ch-1) {
            lists[i].append(ch)
            isInsert = true
            break
        }
    }
    
    if !isInsert {
        if ch == 0 {
            lists.append([0])
        } else {
            flag = false
            return
        }
    }
}

for i in 0..<lists.count {
    if lists[i].last! != 4 {
        flag = false
    }
}

print(flag ? lists.count : -1)
