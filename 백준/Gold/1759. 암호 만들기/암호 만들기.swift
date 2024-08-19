let vewels: [String] = ["a", "e", "i", "o", "u"]
let input = readLine()!.split(separator: " ").map{Int($0)!}
let (l, c) = (input[0], input[1])
var list = readLine()!.split(separator: " ").map{String($0)}
var vewelsList = [String]()
var consonantsList = [String]()
for alphabet in list {
    if vewels.contains(alphabet) {
        vewelsList.append(alphabet)
    } else {
        consonantsList.append(alphabet)
    }
}


func combination(list: [String], target: Int) -> [[String]] {
    var result: [[String]]  = []
    
    func combi(current: [String], currentIndex: Int) {
        if current.count == target {
            result.append(current)
            return
        }
        
        for i in currentIndex..<list.count {
            combi(current: current + [list[i]], currentIndex: i + 1)
        }
    }
    
    combi(current: [], currentIndex: 0)
    return result
}



let consonantsCombi = combination(list: consonantsList, target: 2)
func minRequirements() -> [[String]] {
    var result: [[String]]  = []
    
    for vewel in vewelsList {
        for list in consonantsCombi {
            result.append(list+[vewel])
        }
    }
    return result
}
let requireList = minRequirements()

let totalList = vewelsList + consonantsList
var result = Set<String>()
for str in requireList {
    let tempList = Array(Set(totalList).subtracting(Set(str)))
    let tempCombi = combination(list: tempList, target: l-3)

    for temp in tempCombi {
        let tempResult = str + temp
        let password = tempResult.sorted(by: <).joined(separator: "")
        result.insert(password)
    }
}
result.sorted(by: <).forEach { str in
    print(str)
}

