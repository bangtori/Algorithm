let n = Int(readLine()!)!
let prices = readLine()!.split(separator: " ").map{Int($0)!}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1) // dp[y][x] 는 Px를 사용해서 y개 뽑기 최대값
var maxDp = [Int](repeating: 0, count: n+1) // n개 뽑기 max 기록

for y in 1...n {
    for x in 1...n { 
        if x > y { continue }
        dp[y][x] = prices[x-1] + maxDp[y-x]
        maxDp[y] = max(maxDp[y], dp[y][x])
    }
}

print(maxDp[n])
