let t = Int(readLine()!)!
for _ in 1...t {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n, m) = (input[0], input[1])
    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
    
    for i in 1...m {
        for j in 0...n {
            if j == 0 {
                dp[i][j] = 1
                continue
            }
            if i == j {
                dp[i][j] = 1
                break
            }
            dp[i][j] = dp[i-1][j] + dp[i-1][j-1]
        }
    }
    print(dp[m][n])
}