import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var dp = board

    for x in 1..<board[0].count {
        for y in 1..<board.count {
            if board[y][x] == 0 {
                dp[y][x] = 0
            } else {
                dp[y][x] = min(dp[y-1][x], dp[y][x-1], dp[y-1][x-1]) + 1
            }
        }
    }
    let maxValue = dp.flatMap{$0}.max() ?? 0
    return maxValue*maxValue
}