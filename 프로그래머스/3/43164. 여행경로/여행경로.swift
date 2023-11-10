import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var result: [String] = []
    var visit: [Bool] = Array(repeating: false, count: tickets.count)
    var tickets = tickets.sorted {
        $0[1] < $1[1]
    }

    func dfs(start: String) {
        if result.count == tickets.count {
            result.append(start)
            return
        }
        for i in 0..<tickets.count {
            if tickets[i][0] == start && visit[i] == false {
                visit[i] = true
                result.append(start)
                dfs(start: tickets[i][1])
                if result.count == tickets.count + 1 {
                    return
                }
                result.popLast()
                visit[i] = false
            }
        }
    }
    
    dfs(start: "ICN")
    return result
}