import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}, (m, n) = (input[0], input[1])


func isPrime(_ num: Int) -> Bool {
    if num == 1 { return false }
    if 2..<4 ~= num  { return true }
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 { return false }
    }
    return true
}

for i in m...n {
    if isPrime(i) { print(i) }
}