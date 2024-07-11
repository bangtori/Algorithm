let n = Int(readLine()!)!
var mapList = [[Int]]()
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
let moves = [(0,-1), (0,1), (-1,0), (1,0)]
var currentCount = 0
var result = [Int]()
for _ in 1...n {
    mapList.append(Array(readLine()!).map{Int(String($0))!})
}

func dfs(_ start: (x:Int, y:Int)) {
    visited[start.y][start.x] = true
    currentCount += 1
    for move in moves {
        let next: (x:Int, y:Int) = (start.x+move.0, start.y+move.1)
        if next.x >= 0 && next.x < n && next.y >= 0 && next.y < n{
            if mapList[next.y][next.x] == 1 && visited[next.y][next.x] == false {
                dfs(next)
            }
        }
    }
}

for x in 0..<n {
    for y in 0..<n {
        if mapList[y][x] == 1 && visited[y][x] == false {
            dfs((x,y))
            result.append(currentCount)
            currentCount = 0
        }
    }
}
print(result.count)
result.sorted(by: <).map{
    print($0)
}
