func solution(_ n:Int) -> Int {
    var dp: [Int] = Array(repeating: 0, count: n+1)
    dp[0] = 0
    dp[1] = 1
    for i in 2..<dp.count {
        dp[i] = (dp[i-1] + dp[i-2]) % 1234567
    }
    return dp[n] 
}