let n = Int(readLine()!)!
var count = 0

for _ in 1...n {
    var check = [Character: Int]()
    let word = readLine()!
    var preWord: Character = Character(" ")
    for (i, c) in word.enumerated() {
        if i == 0 {
            preWord = c
            check[c] = 1
        }
        if preWord != c && check[c] != nil {
            break
        } else if preWord != c && check[c] == nil{
            check[c] = 1
        }
        preWord = c
        if i == word.count - 1{
            count += 1
        }
    }
}
print(count)