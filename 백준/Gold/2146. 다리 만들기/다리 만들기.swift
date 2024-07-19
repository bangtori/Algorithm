typealias Position = (x: Int, y:Int)
let n = Int(readLine()!)!
var map = [[Int]]()
for _ in 1...n {
    map.append(readLine()!.split(separator: " ").map{Int($0)!})
}

func findIsland() -> [[Position]]{
    var result = [[Position]]()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    let moves: [Position] = [(-1,0), (1,0), (0,-1), (0,1)]
    func bfs(_ start: Position) -> [Position] {
        var queue = [Position]()
        var island = [Position]()
        queue.append(start)
        var index = 0
        
        while queue.count > index {
            let current = queue[index]
            index += 1
            if visited[current.y][current.x] {
                continue
            }
            visited[current.y][current.x] = true
            island.append(current)
            for move in moves {
                let nx = move.x + current.x
                let ny = move.y + current.y
                if 0..<n ~= nx && 0..<n ~= ny && map[ny][nx] == 1 && !visited[ny][nx] {
                    queue.append((nx, ny))
                }
            }
        }
        return queue
    }
    for x in 0..<n {
        for y in 0..<n {
            if map[y][x] == 1 && !visited[y][x] {
                result.append(bfs((x,y)))
            }
        }
    }
    return result
}

func findMinBridge(_ island: [Position]) -> Int {
    let moves: [Position] = [(-1,0), (1,0), (0,-1), (0,1)]
    var minCount = Int.max
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var dist = [[Int]](repeating: [Int](repeating: 1, count: n), count: n)
    // 본인 섬의 위치는 visitied 표시를 하고 바다와 닿아있는 외각을 찾기
    var queue = [(Position, Int)]()
    for position in island {
        visited[position.y][position.x] = true
        for move in moves {
            let nx = move.x + position.x
            let ny = move.y + position.y
            if 0..<n ~= nx && 0..<n ~= ny && map[ny][nx] == 0 && !visited[ny][nx]{
                // 땅 옆의 바다를 시작지점으로 추가
                queue.append(((nx,ny), 1))
                visited[ny][nx] = true
            }
        }
    }
    
    // bfs 시작
    var index = 0
    while queue.count > index {
        let currentNode = queue[index].0
        let currentCount = queue[index].1
        index += 1
        
        for move in moves {
            let nx = move.x + currentNode.x
            let ny = move.y + currentNode.y
            if 0..<n ~= nx && 0..<n ~= ny && map[ny][nx] == 0 {
                if !visited[ny][nx] || dist[ny][nx] > currentCount + 1 {
                    visited[ny][nx] = true
                    dist[ny][nx] = currentCount + 1
                    queue.append(((nx, ny), currentCount + 1))
                }
            } else if 0..<n ~= nx && 0..<n ~= ny && map[ny][nx] == 1 {
                // 땅을 만났다면 방문기록되어있지 않은 땅이 외부 섬임
                if !visited[ny][nx] {
                    minCount = min(minCount, currentCount)
                }
            }
        }
    }
    return minCount
}


let islands = findIsland()
var result = Int.max

islands.forEach { island in
    result = min(result, findMinBridge(island))
}
print(result)