func factorial(_ n: Int) -> Int {
    var result = 1
    if n > 1 {
        for i in 1...n {
            result *= i
        }
    }
    return result
}

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, k) = (input[0], input[1])
print(factorial(n) / (factorial((n-k)) * factorial(k)))