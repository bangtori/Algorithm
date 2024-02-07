let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n+1)
dp[n] = 0

for i in stride(from: n-1, through: 1, by: -1) {
    var minCount = dp[i+1]
    if i * 3 <= n {
        minCount = min(minCount, dp[i*3])
    }
    if i * 2 <= n {
        minCount = min(minCount, dp[i*2])
    }
    dp[i] = minCount + 1
}

print(dp[1])