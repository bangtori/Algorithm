let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m, k) = (input[0], input[1], input[2])
var map = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)  // 음식물 1 / 없으면 0
for _ in 1...k {
    let position = readLine()!.split(separator: " ").map{Int($0)!}
    let (y, x) = (position[0]-1, position[1]-1)
    map[y][x] = 1
}


var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
let moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
var maxCount = 0

func dfs(_ x: Int, _ y: Int) -> Int {
    var count = 1
    visited[y][x] = true
    
    for move in moves {
        let nx = x + move.0
        let ny = y + move.1
        
        if 0..<m ~= nx && 0..<n ~= ny && map[ny][nx] == 1 && !visited[ny][nx] {
            count += dfs(nx, ny)
        }
    }
    
    return count
}

for x in 0..<m {
    for y in 0..<n {
        if map[y][x] == 1 && !visited[y][x] {
            let currentCount = dfs(x, y)
            maxCount = max(maxCount, currentCount)
        }
    }
}
print(maxCount)
