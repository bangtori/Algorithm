let n = Int(readLine()!)!
if n <= 2 {
    print(1)
} else {
    var dp = [Int](repeating: 1, count: n+1)
    for i in 3...n {
        dp[i] = dp[i-2] + dp[i-1]
    }
    print(dp[n])
}
