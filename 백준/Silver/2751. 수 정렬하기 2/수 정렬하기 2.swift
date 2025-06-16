let n = Int(readLine()!)!
var arr: [Int] = []
for _ in 1...n {
    arr.append(Int(readLine()!)!)
}

arr.sorted(by: <).forEach { print($0) }