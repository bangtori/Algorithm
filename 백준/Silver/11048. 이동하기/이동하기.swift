let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1]) // n = y, m = x
var map = [[Int]]()
for _ in 1...n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

// DP 테이블 초기화
var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
dp[0][0] = map[0][0]

// DP 진행
for y in 0..<n {
    for x in 0..<m {
        if y > 0 {
            dp[y][x] = max(dp[y][x], dp[y-1][x] + map[y][x])
        }
        if x > 0 {
            dp[y][x] = max(dp[y][x], dp[y][x-1] + map[y][x])
        }
        if y > 0 && x > 0 {
            dp[y][x] = max(dp[y][x], dp[y-1][x-1] + map[y][x])
        }
    }
}

print(dp[n-1][m-1])
