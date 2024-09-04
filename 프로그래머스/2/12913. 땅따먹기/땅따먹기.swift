import Foundation

func solution(_ land:[[Int]]) -> Int{
    var dp = [[Int]](repeating: [0, 0, 0, 0], count: land.count)
    for i in 0..<4 {
        dp[0][i] = land[0][i]
    }
    
    for i in 1..<land.count {
        for j in 0..<4 {
            var lineMax = 0
            for k in 0..<4 {
                if k == j { continue }
                lineMax = max(lineMax, dp[i-1][k])
            }
            dp[i][j] = lineMax + land[i][j]
        }
    }
    return dp[land.count-1].max()!
}