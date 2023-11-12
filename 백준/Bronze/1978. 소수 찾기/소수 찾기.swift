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

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{Int($0)!}
var count = 0
nums.map {
    if check($0) {
        count += 1
    }
}
print(count)