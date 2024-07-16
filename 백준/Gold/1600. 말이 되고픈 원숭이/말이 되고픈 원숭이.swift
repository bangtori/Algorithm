let k = Int(readLine()!)!
let len = readLine()!.split(separator: " ").map { Int($0)! }
let (w, h) = (len[0], len[1])
var map = [[Int]]()

for _ in 1...h {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
let horseMoves = [(-2, -1), (-1, -2), (1, -2), (2, -1), (-2, 1), (-1, 2), (1, 2), (2, 1)]

var queue = [(x: Int, y: Int, k: Int, dist: Int)]()
var index = 0
queue.append((0, 0, 0, 0))

var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: w), count: h), count: k + 1)
visited[0][0][0] = true
var minValue = -1
while queue.count > index {
    let current = queue[index]
    index += 1
    
    if current.x == w - 1 && current.y == h - 1 {
        minValue = current.dist
        break
    }
    
    if current.k < k {
        for horseMove in horseMoves {
            let nx = current.x + horseMove.0
            let ny = current.y + horseMove.1
            if 0..<w ~= nx && 0..<h ~= ny && map[ny][nx] == 0 && !visited[current.k + 1][ny][nx] {
                visited[current.k + 1][ny][nx] = true
                queue.append((nx, ny, current.k + 1, current.dist + 1))
            }
        }
    }
    
    for move in moves {
        let nx = current.x + move.0
        let ny = current.y + move.1
        if 0..<w ~= nx && 0..<h ~= ny && map[ny][nx] == 0 && !visited[current.k][ny][nx] {
            visited[current.k][ny][nx] = true
            queue.append((nx, ny, current.k, current.dist + 1))
        }
    }
}

print(minValue)