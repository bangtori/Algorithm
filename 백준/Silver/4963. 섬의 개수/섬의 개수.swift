import Foundation

while true {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let (w, h) = (input[0], input[1])
    if w == 0 && h == 0 { break }
    
    var graph: [[Int]] = []
    var visit: [[Bool]] = []
    for _ in 1...h {
        graph.append(readLine()!.split(separator: " ").map{Int($0)!})
        visit.append(Array(repeating: false, count: w))
    }
    func dfs(_ start: (x: Int, y: Int)) {
        let moves = [(-1,0), (1, 0), (0, 1), (0, -1), (-1, -1), (-1, 1), (1, -1), (1, 1)]
        if visit[start.y][start.x] == false && graph[start.y][start.x] == 1 {
            visit[start.y][start.x] = true
            for move in moves {
                let x = start.x + move.0
                let y = start.y + move.1
                if x >= 0 && x < w && y >= 0 && y < h {
                    dfs((x,y))
                }
            }
        }
    }
    var count = 0
    for i in 0..<h {
        for j in 0..<w {
            if visit[i][j] == false && graph[i][j] == 1 {
                dfs((j,i))
                count += 1
            }
        }
    }
    print(count)
}
