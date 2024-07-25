let t = Int(readLine()!)!
for _ in 1...t {
    let n = Int(readLine()!)!
    var sticker = [[Int]]()
    sticker.append(readLine()!.split(separator: " ").map{Int($0)!})
    sticker.append(readLine()!.split(separator: " ").map{Int($0)!})
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: 2)
    dp[0][0] = sticker[0][0]
    dp[1][0] = sticker[1][0]

    for i in 1..<n {
        // 0번 줄 라인
        let removeMy0 = sticker[0][i] + dp[1][i-1]
        let notRemove0 = max(dp[0][i-1], dp[1][i-1])
        dp[0][i] = max(removeMy0, notRemove0)
        //1번 줄 라인
        let removeMy1 = sticker[1][i] + dp[0][i-1]
        let notRemove1 = max(dp[0][i-1], dp[1][i-1])
        dp[1][i] = max(removeMy1, notRemove1)
    }

    print(max(dp[0][n-1], dp[1][n-1]))
}
