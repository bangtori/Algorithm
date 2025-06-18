let n = Int(readLine()!)!
var wordSet: Set<String> = []
for _ in 1...n {
    wordSet.insert(readLine()!)
}

print(wordSet.sorted(by: {
    if $0.count == $1.count {
        return $0 < $1
    }
    return $0.count < $1.count
}).joined(separator: "\n"))