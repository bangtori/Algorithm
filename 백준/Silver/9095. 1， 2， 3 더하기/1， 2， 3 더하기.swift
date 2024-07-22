let t = Int(readLine()!)!

func sumCount(_ n: Int) -> Int {
    var dp = [Int](repeating: 0, count: 11)
    (dp[1], dp[2], dp[3]) = (1, 2, 4)
    if n > 3 {
        for i in 4...n {
            dp[i] = dp[i-3] + dp[i-2] + dp[i-1]
        }
    }
    return dp[n]
}

for _ in 1...t {
    print(sumCount(Int(readLine()!)!))
}