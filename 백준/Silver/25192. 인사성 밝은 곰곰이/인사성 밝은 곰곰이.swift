let n = Int(readLine()!)!
var nicknameSet = Set<String>()
var count = 0
for _ in 1...n {
    let input = readLine()!
    if input == "ENTER" {
        count += nicknameSet.count
        nicknameSet = []
    } else {
        nicknameSet.insert(input)
    }
}
count += nicknameSet.count
print(count)