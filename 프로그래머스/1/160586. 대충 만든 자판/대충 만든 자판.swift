import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var results: [Int] = []
    var dic = [Character: Int]()
    
    for key in keymap {
        for (i, c) in key.enumerated() {
            if let count = dic[c] {
                if count > i + 1 {
                    dic[c] = i + 1
                }
            } else {
                dic[c] = i + 1
            }
        }
    }
    
    for target in targets {
        var result = 0
        for c in target {
            if let count = dic[c] {
                result += count
            } else {
                result = -1
                break
            }
        }
        results.append(result)
    }

    return results
}