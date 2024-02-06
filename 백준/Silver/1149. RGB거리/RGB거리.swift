let n = Int(readLine()!)!
var costs = [[Int]]()
for _ in 1...n {
    let cost = readLine()!.split(separator: " ").map{Int($0)!}
    costs.append(cost)
}
// [i][0] = r, [i][1] = g, [i][2] = b
var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
[0,1,2].map {
    dp[0][$0] = costs[0][$0]
}

for i in 1..<n {
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + costs[i][0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + costs[i][1]
    dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + costs[i][2]
}

print(dp[n-1].min()!)