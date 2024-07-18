var graph = [[String]]()
typealias Position = (x: Int, y:Int)
for _ in 1...8 {
    graph.append(Array(readLine()!).map{String($0)})
}
let start = (0, 7)
let end = (7, 0)
var visited = [[[Int]]](repeating: [[Int]](repeating: [], count: 8), count: 8) // 방문 times, y,x 좌표

let moves: [Position] = [(1, 0), (-1, 0), (0, 1), (0, -1), (-1, -1), (1, -1), (-1, 1), (1, 1)]
func dfs(position: Position, graph: [[String]], time: Int) -> Bool {
    if !graph.flatMap({$0}).contains("#") {
        // 벽을 가지고 있지 않다면 무조건 도착 가능
        return true
    }
    if position == end {
        return true
    }
    if graph[position.y][position.x] == "#" {
        return false
    }
    visited[position.y][position.x].append(time)
    for move in moves {
        let nx = position.x + move.x
        let ny = position.y + move.y
        if 0..<8 ~= nx && 0..<8 ~= ny && !visited[ny][nx].contains(time) && graph[ny][nx] != "#" {
            if dfs(position: (nx, ny), graph: moveGraph(graph), time: time+1) {
                return true
            }
        }
    }
    if dfs(position: position, graph: moveGraph(graph), time: time+1) {
        return true
    }
    visited[position.y][position.x].remove(at: visited[position.y][position.x].firstIndex(of: time)!)
    return false
}

func moveGraph(_ graph: [[String]]) -> [[String]] {
    var temp = graph
    var wallPosition = [Position]()
    for x in 0..<8 {
        for y in 0..<8 {
            if graph[y][x] == "#" {
                wallPosition.append((x,y))
                temp[y][x] = "."
            }
        }
    }
    wallPosition.forEach { position in
        let nx = position.x
        let ny = position.y + 1
        if 0..<8 ~= ny {
            temp[ny][nx] = "#"
        }
    }
    return temp
}

if dfs(position: start, graph: graph, time: 0) {
    print(1)
} else {
    print(0)
}
