import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 21)

for i in 0...n {
    if i == 0 || i == 1 {
        dp[i] = i
    } else {
        dp[i] = dp[i-1] + dp[i-2]
    }
}
print(dp[n])