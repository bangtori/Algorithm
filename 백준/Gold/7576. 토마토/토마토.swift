let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (m, n) = (input[0], input[1]) //가로 m, 세로 n
var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

for y in 0..<n {
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    graph[y] = line
}

func bfs() {
    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    var index = 0
    var queue = [(x: Int, y: Int)]()
    
    for y in 0..<n {
        for x in 0..<m {
            if graph[y][x] == 1 {
                queue.append((y, x))
            }
        }
    }

    while queue.count > index {
        let y = queue[index].0
        let x = queue[index].1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if 0..<m ~= nx && 0..<n ~= ny && graph[ny][nx] == 0 {
                graph[ny][nx] = graph[y][x] + 1
                queue.append((ny, nx))
            }
        }
        index += 1
    }
}

bfs()

print(graph.flatMap { $0 }.contains(0) ? -1 : graph.flatMap { $0 }.max()! - 1)