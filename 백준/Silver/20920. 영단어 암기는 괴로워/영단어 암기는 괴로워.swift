let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input[0], input[1])
var wordDic = [String: Int]()
for _ in 1...n {
    let word = readLine()!
    if word.count < m {
        continue
    }
    if wordDic[word] != nil {
        wordDic[word] = wordDic[word]! + 1
    } else {
        wordDic[word] = 1
    }
}

let sorted = wordDic.sorted{ (first, second) in
    if first.value == second.value {
        if first.key.count == second.key.count {
            return first.key < second.key
        }
        return first.key.count > second.key.count
    }
    return first.value > second.value
}

sorted.map { (key, _) in
    print(key)
}