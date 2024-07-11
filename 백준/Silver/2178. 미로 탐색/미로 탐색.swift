let lengths = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (lengths[0], lengths[1])
var graph = [[Int]]()

for _ in 1...n {
    let line = Array(readLine()!).map{Int(String($0))!}
    graph.append(line)
}
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var queue = [(Int, Int)]()
var index = 0

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

queue.append((0, 0))

while queue.count > index {
    let node = queue[index]
    index += 1
    if visited[node.1][node.0] { continue }
    
    visited[node.1][node.0] = true
    for i in 0..<4 {
        let nx = dx[i] + node.0
        let ny = dy[i] + node.1
        if 0..<m ~= nx && 0..<n ~= ny && graph[ny][nx] == 1 {
            graph[ny][nx] = graph[node.1][node.0] + 1
            queue.append((nx, ny))
        }
    }
}

print(graph[n-1][m-1])