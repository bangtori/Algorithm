typealias Position = (x: Int, y: Int)
let n = Int(readLine()!)!
var map = [[Int]]()
for _ in 1...n {
    map.append(readLine()!.split(separator: " ").map{Int($0)!})
}

func findSafeArea(rainHeight: Int) -> Int {
    var count = 0
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    
    func bfs(_ start: Position) {
        var queue = [Position]()
        let moves: [Position] = [(1,0), (0,1), (-1,0), (0, -1)]
        queue.append(start)

        var index = 0
        while queue.count > index {
            let node = queue[index]
            index += 1
            if visited[node.y][node.x] || map[node.y][node.x] <= rainHeight {
                continue
            }
            
            visited[node.y][node.x] = true
            
            for move in moves {
                let nx = node.x + move.x
                let ny = node.y + move.y
                
                if 0..<n ~= nx && 0..<n ~= ny && !visited[ny][nx] && map[ny][nx] > rainHeight {
                    queue.append((nx, ny))
                }
            }
        }
    }
    
    for x in 0..<n {
        for y in 0..<n {
            if !visited[y][x] && map[y][x] > rainHeight {
                count += 1
                bfs((x,y))
            }
        }
    }
    return count
}

let maxHeight = map.flatMap({ $0 }).max()!
var maxCount = 0
for i in 0..<maxHeight {
    maxCount = max(maxCount, findSafeArea(rainHeight: i))
}
print(maxCount)