typealias Position = (x: Int, y:Int)
let t = Int(readLine()!)!

func bfs(_ start: Position, _ end: Position, _ l: Int) -> Int {
    let moves: [Position] = [(-1, -2), (-2, -1), (1, -2), (2, -1), (-2, 1), (-1, 2), (1, 2), (2, 1)]
    var map = [[Int]](repeating: [Int](repeating: 0, count: l), count: l)
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: l), count: l)
    var queue = [(Position, Int)]()
    queue.append((start, 0))
    visited[start.y][start.x] = true
    var index = 0
    
    while queue.count > index {
        let currentNode = queue[index].0
        let currentCount = queue[index].1
        index += 1
        
        for move in moves {
            let nx = move.x + currentNode.x
            let ny = move.y + currentNode.y
            
            if 0..<l ~= nx && 0..<l ~= ny {
                if !visited[ny][nx] || map[ny][nx] > currentCount + 1 {
                    visited[ny][nx] = true
                    map[ny][nx] = currentCount + 1
                    queue.append(((nx, ny), currentCount+1))
                }
            }
        }
    }
    
    return map[end.y][end.x]
}

for _ in 1...t {
    let l = Int(readLine()!)!
    let startInput = readLine()!.split(separator: " ").map{Int($0)!}
    let endInput = readLine()!.split(separator: " ").map{Int($0)!}
    let start: Position = (startInput[0], startInput[1])
    let end: Position = (endInput[0], endInput[1])
    
    print(bfs(start, end, l))
}