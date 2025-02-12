import Foundation

func solution(_ maps:[String]) -> Int {
    typealias Position = (x: Int, y: Int)
    let maps = maps.map{Array($0)}
    let xLen = maps[0].count
    let yLen = maps.count

    func bfs(_ start: Position, target: Character) -> (pos: Position?, count: Int) {
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: xLen), count: yLen)
        var queue = [(pos: Position, count: Int)]()
        var index = 0
        
        let moves: [Position] = [(1,0),(0,1),(-1,0),(0,-1)]
        
        queue.append((start, 0))
        
        while queue.count > index {
            let node = queue[index].pos
            let count = queue[index].count
            
            if maps[node.y][node.x] == target {
                return queue[index]
            }
            index += 1
            
            if visited[node.y][node.x] { continue }
            visited[node.y][node.x] = true
            
            for move in moves {
                let nx = node.x + move.x
                let ny = node.y + move.y
                if 0..<xLen ~= nx && 0..<yLen ~= ny && maps[ny][nx] != Character("X") {
                    queue.append(((nx, ny), count+1))
                }
            }
        }
        return (nil, -1)
    }
    
    func findStart() -> Position? {
        for y in 0..<yLen {
            for x in 0..<xLen {
                if maps[y][x] == "S" {
                    return (x, y)
                }
            }
        }
        return nil
    }
    guard let start = findStart() else {
        return -1
    }

    let leverResult = bfs(start, target: "L")
    if leverResult.count == -1 {
        return -1
    }

    guard let leverPos = leverResult.pos else {
        return -1
    }
    let exitResult = bfs(leverPos, target: "E")
    if exitResult.count == -1 {
        return -1
    }

    return leverResult.count + exitResult.count
}