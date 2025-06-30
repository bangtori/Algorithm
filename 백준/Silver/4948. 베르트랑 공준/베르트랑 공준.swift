let maxValue = 246912

var isPrimeDP = [Bool](repeating: true, count: maxValue + 1)
isPrimeDP[0] = false
isPrimeDP[1] = false
for i in 2...Int(Double(maxValue).squareRoot()) {
    if isPrimeDP[i] {
        for j in stride(from: i*i, through: maxValue, by: i) {
            isPrimeDP[j] = false
        }
    }
}

var dp = [Int](repeating: 0, count: maxValue + 1)
for i in 1...maxValue {
    dp[i] = dp[i - 1] + (isPrimeDP[i] ? 1 : 0)
}

while let line = readLine(), let n = Int(line), n != 0 {
    print(dp[n * 2] - dp[n])
}
