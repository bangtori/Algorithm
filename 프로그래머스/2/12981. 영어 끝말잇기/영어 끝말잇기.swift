import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var startCharacter: Character = words[0].last!
    var previousWords: [String: Bool] = [words[0]: true]
    var result = [0,0]
    for i in 1..<words.count {
        if words[i].first! != startCharacter || previousWords[words[i]] != nil {
            let person = (i+1) % n == 0 ? n : (i+1) % n
            let turn = i / n + 1
            result = [person, turn]
            break
        }
        previousWords[words[i]] = true
        startCharacter = words[i].last!
    }
    return result
}