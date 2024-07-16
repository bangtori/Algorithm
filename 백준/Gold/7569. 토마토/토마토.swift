let len = readLine()!.split(separator: " ").map{Int($0)!}
let (m, n, h) = (len[0], len[1], len[2])
var graph = Array(repeating: Array(repeating: [Int](), count: n), count: h)


for i in 0..<h {
    for j in 0..<n {
        graph[i][j] = readLine()!.split(separator: " ").map { Int($0)! }
    }
}

func findRipeTomatoes() -> [(Int, Int, Int)] {
    var result = [(Int, Int, Int)]()
    
    for i in 0..<h {
        for j in 0..<n {
            for k in 0..<m {
                if graph[i][j][k] == 1 {
                    result.append((k,j,i))
                }
            }
        }
    }
    return result
}
var minResult = Int.max
func bfs() {
    var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: m), count: n), count: h)
    var queue: [(x: Int, y: Int, z: Int)] = []
    var index = 0
    findRipeTomatoes().forEach { startNodes in
        queue.append(startNodes)
    }
    let moves: [(x: Int, y: Int, z: Int)] = [(1,0,0), (-1,0,0), (0,1,0), (0,-1,0), (0,0,1), (0,0,-1)]
    while queue.count > index {
        let node = queue[index]
        index += 1
        if visited[node.z][node.y][node.x] { continue }
        visited[node.z][node.y][node.x] = true
        for move in moves {
            let nextNode: (x:Int, y:Int, z:Int) = (node.x + move.x, node.y + move.y, node.z + move.z)
            if 0..<m ~= nextNode.x && 0..<n ~= nextNode.y && 0..<h ~= nextNode.z && graph[nextNode.z][nextNode.y][nextNode.x] == 0 && !visited[nextNode.z][nextNode.y][nextNode.x] {
                graph[nextNode.z][nextNode.y][nextNode.x] = graph[node.z][node.y][node.x] + 1
                queue.append((nextNode.x, nextNode.y, nextNode.z))
            }
        }
    }
    if graph.flatMap({$0}).flatMap({$0}).contains(0) {
        minResult = -1
    }
    else {
        minResult = graph.flatMap({$0}).flatMap({$0}).max()! - 1
    }
}

if !graph.flatMap({$0}).flatMap({$0}).contains(0) {
    print(0)
} else {
    bfs()
    print(minResult)
}
