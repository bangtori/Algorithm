import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visit = Array(repeating: false, count: n)
    
    func dfs(start: Int) {
        visit[start] = true
        for (i, computer) in computers[start].enumerated() {
            if visit[i] == false && computer == 1 {
                dfs(start: i)
            }
        }
    }
    
    var count = 0
    for i in 0..<n {
        if visit[i] == false{
            dfs(start: i)
            count += 1
        }
    }
    return count
}