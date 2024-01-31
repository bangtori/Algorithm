let n = Int(readLine()!)!
var ability = [[Int]]()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    ability.append(input)
}

func combi(_ nums: [Int], _ targetNum: Int) -> [[Int]] {
    var result = [[Int]]()
    
    func combination(_ index: Int, _ nowCombi: [Int]) {
        if nowCombi.count == targetNum {
            result.append(nowCombi)
            return
        }
        for i in index..<nums.count {
            combination(i + 1, nowCombi + [nums[i]])
        }
    }
    
    combination(0, [])
    
    return result
}

let teamList = combi([Int](1...n), n/2)

var result = [Int]()
for teamIndex in 0..<teamList.count/2 {
    let aTeam = combi(teamList[teamIndex], 2)
    let aTeamCount = aTeam.reduce(0) { partialResult, indexs in
        partialResult + (ability[indexs[0]-1][indexs[1]-1] + ability[indexs[1]-1][indexs[0]-1])
    }
    
    let bTeam = combi(teamList[teamList.count-1-teamIndex], 2)
    let bTeamCount = bTeam.reduce(0) { partialResult, indexs in
        partialResult + (ability[indexs[0]-1][indexs[1]-1] + ability[indexs[1]-1][indexs[0]-1])
    }
    
    result.append(abs(aTeamCount-bTeamCount))
}

print(result.min()!)
