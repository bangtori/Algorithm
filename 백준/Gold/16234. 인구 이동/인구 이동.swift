let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, l, r) = (input[0],input[1],input[2])
var map = [[Int]]()

for _ in 1...n {
    map.append(readLine()!.split(separator: " ").map{Int($0)!})
}

var count = 0
let moves = [(1,0),(-1,0),(0,1),(0,-1)]

func bfs(_ start: (x:Int, y:Int), visited: inout [[Bool]]) -> [(Int, Int)] {
    // 현재 지점에서 방문할 수 있는(국경을 넘어갈 수 있는) 연결된 노드 찾고 해당 노드들의 값을 평균값으로 변환한 뒤 해당 노드들의 리스트를 반환하는 함수
    var queue: [(x:Int, y:Int)] = [start]
    var index = 0
    visited[start.y][start.x] = true
    
    while queue.count > index {
        let current = queue[index]
        index += 1
        for move in moves {
            let nx = move.0 + current.x
            let ny = move.1 + current.y
            if 0..<n ~= nx && 0..<n ~= ny && !visited[ny][nx] {
                if l...r ~= abs(map[current.y][current.x] - map[ny][nx]) {
                    queue.append((nx, ny))
                    visited[ny][nx] = true
                }
            }
        }
    }

    let result = Int(queue.reduce(0) { $0 + map[$1.y][$1.x] } / queue.count)
    queue.forEach { (x, y) in
        map[y][x] = result
    }
    return queue
}



func oneTurnOpen() -> Bool {
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var found = false
    for y in 0..<n {
        for x in 0..<n {
            if !visited[y][x] {
                let result = bfs((x, y), visited: &visited)
                if result.count > 1 {
                    found = true
                }
            }
        }
    }
    return found
}

while true {
    if oneTurnOpen() {
        count += 1
    } else {
        break
    }
}

print(count)
