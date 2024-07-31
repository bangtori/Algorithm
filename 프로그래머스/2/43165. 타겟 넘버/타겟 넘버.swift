import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    func dfs(currentIndex: Int, result: Int) {
        if currentIndex == numbers.count {
            if target == result { count += 1 }
            return
        }
        dfs(currentIndex: currentIndex+1, result: result+numbers[currentIndex])
        dfs(currentIndex: currentIndex+1, result: result-numbers[currentIndex])
    }
    dfs(currentIndex: 0, result: 0)
    return count
}