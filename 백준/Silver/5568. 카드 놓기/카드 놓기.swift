func permute(arr: [Int], target: Int) -> [[Int]] {
    var result = [[Int]]()
    var visited = [Bool](repeating: false, count: arr.count)
    
    func permutation(current: [Int]) {
        if current.count == target {
            result.append(current)
            return
        }
        
        for i in 0..<arr.count {
            if visited[i] == false {
                visited[i] = true
                permutation(current: current + [arr[i]])
                visited[i] = false
            }
        }
    }
    permutation(current: [])
    return result
}

let n = Int(readLine()!)!
let k = Int(readLine()!)!
var cards = [Int]()
for _ in 1...n{
    cards.append(Int(readLine()!)!)
}

let permuteCard = permute(arr: cards, target: k)
var resultSet = Set<String>()
for card in permuteCard {
    let number = card.map {String($0)}.joined(separator: "")
    resultSet.insert(number)
}

print(resultSet.count)