import Foundation

func solution(_ sequence:[Int]) -> Int64 {
    var dp:[[Int64]] = [[Int64]](repeating: [Int64](repeating: 0, count: sequence.count), count: 2)
    
    dp[0][0] = Int64(sequence[0])
    dp[1][0] = Int64(-sequence[0])
    var maxValue: Int64 = max(dp[0][0], dp[1][0])
    for i in 1..<sequence.count {
        let num = Int64(sequence[i])
        dp[0][i] = max(dp[1][i-1]+num, num)
        dp[1][i] = max(dp[0][i-1]-num, -num)
        
        maxValue = max(maxValue, max(dp[0][i], dp[1][i]))
    }
    return maxValue
}