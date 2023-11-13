let n = Int(readLine()!)!
var result = 0
for i in 1...n {
    let sum = String(i).map{Int(String($0))!}.reduce(0, {$0 + $1}) + i
    if sum == n {
        result = i
        break
    }
}

print(result)