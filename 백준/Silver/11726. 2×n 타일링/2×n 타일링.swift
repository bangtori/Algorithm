let n = Int(readLine()!)!
var dp = [Int](repeating: 1, count: n+1)

if n >= 2 {
    for i in 2...n {
        dp[i] = (dp[i-2] + dp[i-1]) % 10007
    }
}
print(dp[n])