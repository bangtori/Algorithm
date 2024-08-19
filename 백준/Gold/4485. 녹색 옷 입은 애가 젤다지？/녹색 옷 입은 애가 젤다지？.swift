typealias Position = (x: Int, y: Int)
let moves: [Position] = [(1,0), (-1,0), (0,1), (0,-1)]


func bfs(start: Position, map: [[Int]], n: Int) -> Int {
    var tempMap = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
    var queue: [Position] = []
    var index = 0
    queue.append(start)
    tempMap[start.y][start.x] = map[start.y][start.x]
    
    while queue.count > index {
        let pos = queue[index]
        index += 1
        
        for move in moves {
            let next: Position = (pos.x+move.x, pos.y+move.y)
            if 0..<n ~= next.x && 0..<n ~= next.y {
                let distance = tempMap[pos.y][pos.x] + map[next.y][next.x]
                if tempMap[next.y][next.x] == Int.max || tempMap[next.y][next.x] > distance {
                    tempMap[next.y][next.x] = distance
                    queue.append(next)
                }
            }
        }
    }
    
    return tempMap[n-1][n-1]
}

var currentCount = 1
while true {
    let n = Int(readLine()!)!
    if n == 0 {
        break
    }
    var currentMap = [[Int]]()
    for _ in 1...n {
        currentMap.append(readLine()!.split(separator: " ").map{Int($0)!})
    }
    let result = bfs(start: (0,0), map: currentMap, n: n)
    
    print("Problem \(currentCount): \(result)")
    currentCount += 1
}