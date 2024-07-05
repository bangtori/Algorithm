let n = Int(readLine()!)!
var list: [(t: Int, p: Int)] = []

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    list.append((input[0], input[1]))
}

var dp = [Int](repeating: 0, count: n+1)


for i in stride(from: n-1, through: 0, by: -1) {
    if i + list[i].t > n {
        dp[i] = dp[i+1]
    } else {
        dp[i] = max(dp[i+1], list[i].p + dp[i + list[i].t])
    }
}

print(dp[0])