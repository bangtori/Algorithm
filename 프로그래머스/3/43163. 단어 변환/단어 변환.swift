import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var result = 0
    
    func bfs(currentWord: String, visit: [Bool] ,count: Int) {
        if currentWord == target {
            if result == 0 || result > count {
                result = count
            }
        }
        for (i, word) in words.enumerated() {
            if visit[i] == false && check(str1: word, str2: currentWord) {
                var newVisit = visit
                newVisit[i] = true
                bfs(currentWord: word, visit: newVisit, count: count + 1)
            }
        }
    }
    
    bfs(currentWord: begin, visit: Array(repeating: false, count: words.count), count: 0)
    return result
}

func check(str1: String, str2: String) -> Bool {
    var arr1 = str1.map{ $0 }
    var arr2 = str2.map{ $0 }
    var count = 0
    for i in 0..<arr1.count {
        if arr1[i] != arr2[i] { count += 1 }
    }
    return count == 1
}