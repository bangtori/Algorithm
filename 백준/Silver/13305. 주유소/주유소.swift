let n = Int(readLine()!)!
let distances = readLine()!.split(separator: " ").map{Int($0)!}
let prices = readLine()!.split(separator: " ").map{Int($0)!}

var minPirce = prices[0]
var sum = 0
for i in 0..<distances.count {
    sum += (minPirce * distances[i])
    if minPirce > prices[i+1] {
        minPirce = prices[i+1]
    }
}

print(sum)