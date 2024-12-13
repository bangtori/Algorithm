func solution(_ n:Int) -> Int {
    var dp: [Int] = Array(repeating: 0, count: n+1)
    if n < 3 { return n }
    dp[1] = 1
    dp[2] = 2
    for i in 3...n {
        dp[i] = (dp[i-1] + dp[i-2]) % 1234567
    }
    return dp[n]
}
