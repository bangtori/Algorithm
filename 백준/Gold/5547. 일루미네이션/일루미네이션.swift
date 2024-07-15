let len = readLine()!.split(separator: " ").map{Int($0)!}
let (w, h) = (len[0], len[1])
var home = [[Int]]()
for _ in 1...h {
    home.append(readLine()!.split(separator: " ").map{Int($0)!})
}
// y짝수 일때
let moveEven = [(-1, -1), (0, -1), (-1, 0), (1, 0), (-1, 1), (0, 1)]
// y홀수 일때
let moveOdd = [(0, -1), (1, -1), (-1, 0), (1, 0), (0, 1), (1, 1)]

var visited = [[Bool]](repeating: [Bool](repeating: false, count: w), count: h)

func dfs(x: Int, y: Int) -> Bool {
    var stack = [(x, y)]
    var isOuter = false
    var toMark = [(Int, Int)]()
    
    while !stack.isEmpty {
        let (cx, cy) = stack.removeLast()
        
        if visited[cy][cx] {
            continue
        }
        
        visited[cy][cx] = true
        toMark.append((cx, cy))
        
        let moves = cy % 2 == 0 ? moveOdd : moveEven // 0부터 인덱스 시작이므로 짝수 홀수 반대
        for move in moves {
            let nx = cx + move.0
            let ny = cy + move.1
            
            if nx < 0 || nx >= w || ny < 0 || ny >= h {
                isOuter = true
            } else if !visited[ny][nx] && home[ny][nx] == 0 {
                stack.append((nx, ny))
            }
        }
    }
    
    if !isOuter {
        for (mx, my) in toMark {
            home[my][mx] = 2
        }
    }
    
    return isOuter
}

// 모든 빈 공간을 탐색하여 내부 공간을 마킹
for y in 0..<h {
    for x in 0..<w {
        if home[y][x] == 0 && !visited[y][x] {
            _ = dfs(x: x, y: y)
        }
    }
}

visited = [[Bool]](repeating: [Bool](repeating: false, count: w), count: h)
var result = 0
func bfs(start: (Int, Int)) {
    var queue = [(Int, Int)]()
    var index = 0
    queue.append(start)
    while queue.count > index {
        let node = queue[index]
        index += 1
        if visited[node.1][node.0] { continue }
        
        visited[node.1][node.0] = true
        if node.1 % 2 != 0 { // 0부터 시작했으므로 짝수 홀수 반대
            // 짝수 일 때
            for move in moveEven {
                let nx = move.0 + node.0
                let ny = move.1 + node.1
                if home[node.1][node.0] == 1 {
                    // 건물이 있는 곳에서 조명 장식할 곳 체크
                    if 0..<w ~= nx && 0..<h ~= ny {
                        if home[ny][nx] == 0 {
                            // 외부인 경우 조명 장식
                            result += 1
                        }
                    } else {
                        // 범위를 벗어나는 외벽인 경우 무조건 조명 장식
                        result += 1
                    }
                    
                }
                if 0..<w ~= nx && 0..<h ~= ny && !visited[ny][nx] {
                    //  방문하지 않은 곳 방문
                    queue.append((nx,ny))
                }
            }
        } else {
            // 홀수 일떄
            for move in moveOdd {
                let nx = move.0 + node.0
                let ny = move.1 + node.1
                if home[node.1][node.0] == 1 {
                    // 건물이 있는 곳에서 조명 장식할 곳 체크
                    if 0..<w ~= nx && 0..<h ~= ny {
                        if home[ny][nx] == 0 {
                            // 외부인 경우 조명 장식
                            result += 1
                        }
                    } else {
                        // 범위를 벗어나는 외벽인 경우 무조건 조명 장식
                        result += 1
                    }
                    
                }
                if 0..<w ~= nx && 0..<h ~= ny && !visited[ny][nx] {
                    //  방문하지 않은 곳 방문
                    queue.append((nx,ny))
                }
            }
        }
    }
}

bfs(start: (0,0))

print(result)
