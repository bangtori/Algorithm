let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var dp = [Int](repeating: 0, count: n)
dp[0] = arr[0]
for i in 1..<n {
    if dp[i-1] + arr[i] > arr[i] {
        dp[i] = dp[i-1] + arr[i]
    } else {
        dp[i] = arr[i]
    }
}

print(dp.max()!)