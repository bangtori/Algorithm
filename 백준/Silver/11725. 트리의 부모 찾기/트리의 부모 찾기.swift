let n = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: n+1)
var parents = [Int](repeating: 0, count: n+1)
for _ in 1..<n {
    let edge = readLine()!.split(separator: " ").map{Int($0)!}
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}


func bfs(_ start: Int) {
    var queue = [Int]()
    var visited = [Bool](repeating: false, count: n+1)
    var index = 0
    queue.append(start)
    
    while queue.count > index {
        let node = queue[index]
        index += 1
        if visited[node] { continue }
        
        visited[node] = true
        queue.append(contentsOf: graph[node])
        graph[node].forEach { child in
            if !visited[child] {
                parents[child] = node
            }
        }
    }
}

bfs(1)

for i in 2...n {
    print(parents[i])
}
