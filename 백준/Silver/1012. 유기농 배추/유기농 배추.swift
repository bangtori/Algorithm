let t = Int(readLine()!)!

for _ in 1...t {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let (m, n, k) = (input[0], input[1], input[2])
    var mapList = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    let moves = [(0,-1), (0,1), (-1,0), (1,0)]
    var result = 0
    
    for _ in 1...k {
        let point = readLine()!.split(separator: " ").map{ Int($0)! }
        mapList[point[1]][point[0]] = 1
    }
    
    func dfs(_ start: (x:Int, y:Int)) {
        visited[start.y][start.x] = true

        for move in moves {
            let next: (x:Int, y:Int) = (start.x+move.0, start.y+move.1)
            if next.x >= 0 && next.x < m && next.y >= 0 && next.y < n{
                if mapList[next.y][next.x] == 1 && visited[next.y][next.x] == false {
                    dfs(next)
                }
            }
        }
    }
    
    for x in 0..<m {
        for y in 0..<n {
            if mapList[y][x] == 1 && visited[y][x] == false {
                dfs((x,y))
                result += 1
            }
        }
    }
    print(result)
}