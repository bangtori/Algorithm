import Foundation

func solution(_ gems:[String]) -> [Int] {
    var dic = [String: Int]()
    let totalGemTypes = Set(gems).count  // 모든 보석 종류의 개수
    var startPointer = 0
    var endPointer = 0
    var answer = [0, gems.count]
    var currentGemTypes = 0  // 현재 구간에 포함된 보석 종류의 개수
    
    while endPointer < gems.count {
        let gem = gems[endPointer]
        dic[gem, default: 0] += 1
        
        if dic[gem] == 1 {
            currentGemTypes += 1
        }
        
        while currentGemTypes == totalGemTypes {
            if endPointer - startPointer < answer[1] - answer[0] {
                answer = [startPointer + 1, endPointer + 1]
            }

            let startGem = gems[startPointer]
            dic[startGem]! -= 1
            if dic[startGem] == 0 {
                currentGemTypes -= 1
            }
            startPointer += 1
        }
        
        endPointer += 1
    }

    return answer
}