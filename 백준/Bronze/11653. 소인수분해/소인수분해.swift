import Foundation

func getDivisors(_ n: Int) -> [Int] {
    var result = [Int]()
    for i in 1...Int(sqrt(Double(n))) {
        if n % i == 0 {
            result.append(i)
            if i != n / i { result.append(n/i) }
        }
    }
    return result
}
func isPrime(_ n: Int) -> Bool {
    if n < 3 {
        return n == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(n))) + 1 {
        if n % i == 0 { return false }
    }
    return true
}

var n = Int(readLine()!)!
let primeDivisors = getDivisors(n).filter{isPrime($0)}
var i = 0
while i < primeDivisors.count {
    if n % primeDivisors[i] == 0 {
        print(primeDivisors[i])
        n = n / primeDivisors[i]
    } else {
        i += 1
    }
}