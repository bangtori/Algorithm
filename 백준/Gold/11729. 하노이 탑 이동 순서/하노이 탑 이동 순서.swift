let n = Int(readLine()!)!
var result = [String]()

func hanoi(n: Int, from: Int, via: Int, to: Int) {
    if n == 1 {
        result.append("\(from) \(to)")
        return
    }
    hanoi(n: n - 1, from: from, via: to, to: via)
    result.append("\(from) \(to)")
    hanoi(n: n - 1, from: via, via: from, to: to)
}


hanoi(n: n, from: 1, via: 2, to: 3)
print(result.count)
print(result.joined(separator: "\n"))