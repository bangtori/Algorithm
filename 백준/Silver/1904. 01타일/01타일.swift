func dp(_ n: Int) -> Int {
    var arr = Array(repeating: 0, count: n+1)
    if n < 3 {
        return n
    }
    arr[1] = 1
    arr[2] = 2
    if n >= 3 {
        for i in 3...n {
            arr[i] = (arr[i-1] + arr[i-2]) % 15746
        }
    }
    return arr[n]
}

let n = Int(readLine()!)!
print(dp(n))