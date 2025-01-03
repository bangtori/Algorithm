func sum(_ str: String) -> Int {
    let sum = str.compactMap { char in
        char.wholeNumberValue
    }.reduce(0, +)
    return sum
}
let n = Int(readLine()!)!
var serialNumber: [String] = []
for _ in 0..<n {
    serialNumber.append(readLine()!)
}
let result = serialNumber.sorted {
    if $0.count == $1.count {
        let sum1 = sum($0)
        let sum2 = sum($1)
        if sum1 == sum2 {
            return $0 < $1
        }
        return sum1 < sum2
    }
    return $0.count < $1.count
}

result.forEach { str in
    print(str)
}