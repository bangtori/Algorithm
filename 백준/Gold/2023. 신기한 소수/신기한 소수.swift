import Foundation

let n = Int(readLine()!)!

func check(n: Int) -> Bool {
    if n == 1 {
        return false
    }
    if n == 2 {
        return true
    }
    let sqrt = Int(sqrt(Double(n)))
    for i in 2...(sqrt + 1) {
        if n % i == 0 {
            return false
        }
    }
    return true
}

func back(number: String) {
    if number.count == n {
        result.append(number)
    }
    
    for i in 0...9 {
        let next = "\(number)\(i)"
        if check(n: Int(next)!) {
            back(number: next)
        }
    }
}
var first = ["2", "3", "5", "7"]
var result: [String] = []
for f in first {
    back(number: f)
}

print(result.joined(separator: "\n"))