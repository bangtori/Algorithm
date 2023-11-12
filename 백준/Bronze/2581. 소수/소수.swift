import Foundation
func check(_ a: Int) -> Bool {
    if a == 1 {
        return false
    }
    if a == 2 {
        return true
    }
    for i in 2...Int(sqrt(Double(a)))+1 {
        if a % i == 0 {
            return false
        }
    }
    return true
}

let m = Int(readLine()!)!
let n = Int(readLine()!)!
var result = [Int]()
for i in m...n {
    if check(i) {
        result.append(i)
    }
}
if result.isEmpty {
    print(-1)
}else {
    print(result.reduce(0, {$0 + $1}))
    print(result[0])
}