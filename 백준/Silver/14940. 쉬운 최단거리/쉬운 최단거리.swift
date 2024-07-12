let len = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (len[0], len[1])
var graph = [[Int]]()
for _ in 1...n {
    graph.append(readLine()!.split(separator: " ").map{Int($0)!})
}


var start = (0, 0)
loop: for x in 0..<m {
    for y in 0..<n {
        if graph[y][x] == 2 {
            start = (x,y)
            break loop
        }
    }
}
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
func dfs(start: (Int, Int)) {
    var queue = [(Int, Int)]()
    var index = 0
    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    
    queue.append(start)
    
    while queue.count > index {
        let node = queue[index]
        index += 1
        if visited[node.1][node.0] { continue }
        
        visited[node.1][node.0] = true
        for i in 0..<4 {
            let nx = dx[i] + node.0
            let ny = dy[i] + node.1
            
            if 0..<m ~= nx && 0..<n ~= ny && graph[ny][nx] == 1 && !visited[ny][nx] {
                graph[ny][nx] = graph[node.1][node.0] + 1
                queue.append((nx,ny))
            }
        }
    }
}


graph[start.1][start.0] = 0
dfs(start: start)

// 방문하지 못한 곳 처리
for x in 0..<m {
    for y in 0..<n {
        if visited[y][x] == false && graph[y][x] == 1 {
            //방문하지 않았는데 갈수있는 땅이라면
            graph[y][x] = -1
        }
    }
}

for i in 0..<n {
    print(graph[i].map{String($0)}.joined(separator: " "))
}



