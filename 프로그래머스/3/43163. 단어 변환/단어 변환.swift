import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var result = 0
    func bfs(currentWord: String, count: Int, visit: [Bool]) {
        if currentWord == target {
            result = result == 0 || result > count ? count : result
        }

        for (i, word) in words.enumerated() {
            if visit[i] == false && check(currentWord, word) {
                var newVisit = visit
                newVisit[i] = true
                bfs(currentWord: word, count: count + 1, visit: newVisit)
            }
        }
    }
    bfs(currentWord: begin, count: 0, visit: Array(repeating: false, count: words.count))
    return result
}

func check(_ str1: String, _ str2: String) -> Bool {
    let arr1 = str1.map{ $0 }
    let arr2 = str2.map{ $0 }
    var count = 0
    for i in 0..<arr1.count {
        if arr1[i] != arr2[i] { count += 1 }
    }
    return count == 1
}