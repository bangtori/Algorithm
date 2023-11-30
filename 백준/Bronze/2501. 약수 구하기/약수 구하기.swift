import Foundation
let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, k) = (input[0], input[1])
var result = [Int]()
for i in 1...Int(sqrt(Double(n))) {
    if n % i == 0 {
        result.append(i)
        if i != n / i { result.append(n/i) }
    }
}
result.count < k ? print(0) : print(result.sorted(by: <)[k-1])