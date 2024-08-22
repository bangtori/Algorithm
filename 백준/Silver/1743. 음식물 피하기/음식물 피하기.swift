typealias Position = (x: Int, y: Int)
let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m, k) = (input[0], input[1], input[2])
var map = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

for _ in 1...k {
    let pos = readLine()!.split(separator: " ").map{Int($0)!}
    map[pos[0]-1][pos[1]-1] = 1
}
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
func bfs(_ start: Position) -> Int {
    var queue = [Position]()
    var index = 0
    var count = 0
    queue.append(start)
    visited[start.y][start.x] = true
    count += 1
    let moves: [Position] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    
    while queue.count > index {
        let pos = queue[index]
        index += 1
        
        for move in moves {
            let next: Position = (pos.x+move.x, pos.y+move.y)
            
            if 0..<m ~= next.x && 0..<n ~= next.y && map[next.y][next.x] != 0 && visited[next.y][next.x] == false {
                visited[next.y][next.x] = true
                queue.append(next)
                count += 1
            }
        }
    }
    return count
}

var maxResult = 0
for x in 0..<m {
    for y in 0..<n {
        if map[y][x] != 0 && visited[y][x] == false {
            maxResult = max(maxResult, bfs((x,y)))
        }
    }
}
print(maxResult)