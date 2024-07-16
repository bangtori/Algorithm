let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input[0], input[1])
var graph = [[Int]](repeating: [], count: n)

for _ in 1...m {
    let relationship = readLine()!.split(separator: " ").map{Int($0)!}
    graph[relationship[0]].append(relationship[1])
    graph[relationship[1]].append(relationship[0])
}

var visited = [Bool](repeating: false, count: n)

func dfs(current: Int, depth: Int) -> Bool {
    if depth == 4 {
        return true
    }
    visited[current] = true
    for next in graph[current] {
        if !visited[next] {
            if dfs(current: next, depth: depth + 1) {
                return true
            }
        }
    }
    visited[current] = false
    return false
}
var result = 0
for i in 0..<n {
    visited = [Bool](repeating: false, count: n)
    if dfs(current: i, depth: 0) {
        result = 1
    }
}
print(result)