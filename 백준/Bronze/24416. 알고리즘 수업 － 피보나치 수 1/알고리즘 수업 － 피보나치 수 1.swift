func fibo(_ n: Int) -> Int {
    var f = Array(repeating: 0, count: 41)
    f[1] = 1
    f[2] = 1
    for i in 3...n {
        f[i] = f[i-1] + f[i-2]
    }
    return f[n]
}

let n = Int(readLine()!)!
let fiboResult = fibo(n)
print("\(fiboResult) \(n-2)")