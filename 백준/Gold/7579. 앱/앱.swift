let input = readLine()!.split(separator: " ").map{Int($0)!}, (n,m) = (input[0], input[1])
let memories = readLine()!.split(separator: " ").map { Int(String($0))! }
let costs = readLine()!.split(separator: " ").map { Int(String($0))! }

let maxCost = costs.reduce(0, +)
var dp = [Int](repeating: 0, count: maxCost + 1)

for i in 0..<n {
    let memory = memories[i]
    let cost = costs[i]
    
    for j in stride(from: maxCost, through: cost, by: -1) {
        dp[j] = max(dp[j], dp[j - cost] + memory)
    }
}

for i in 0...maxCost {
    if dp[i] >= m {
        print(i)
        break
    }
}