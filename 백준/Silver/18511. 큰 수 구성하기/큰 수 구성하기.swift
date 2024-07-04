let input = readLine()!.split(separator: " ").map { String($0) }
let n = Int(input[0])!
let nArr = Array(input[0]).map{Int(String($0))!}
let kArr = readLine()!.split(separator: " ").map { Int($0)! }
var nLen = nArr.count

func permuteWithRepetition(_ elements: [Int], length: Int) -> [[Int]] {
    if length == 1 {
        return elements.map { [$0] }
    }

    var result = [[Int]]()
    let subPermutations = permuteWithRepetition(elements, length: length - 1)
    
    for element in elements {
        for permutation in subPermutations {
            result.append([element] + permutation)
        }
    }
    
    return result
}

while true {
    let arr = permuteWithRepetition(kArr, length: nLen)
    var result = [Int]()
    for i in arr {
        let num = Int(i.map{String($0)}.joined(separator: ""))!
        if num <= n {
            result.append(num)
        }
    }
    if !result.isEmpty {
        print(result.max()!)
        break
    }
    nLen -= 1
}