let lengths = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (lengths[0], lengths[1])
var tempGraph = [[Int]]()


for _ in 1...n {
    tempGraph.append(readLine()!.split(separator: " ").map{Int($0)!})
}

var graph = tempGraph

func bfs() -> Int {
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    for x in 0..<m {
        for y in 0..<n {
            if graph[y][x] == 2 && !visited[y][x] {
                var queue = [(Int, Int)]()
                var index = 0
                let dx = [1, 0, -1, 0]
                let dy = [0, 1, 0, -1]

                queue.append((x,y))

                while queue.count > index {
                    let node = queue[index]
                    index += 1
                    if visited[node.1][node.0] { continue }

                    visited[node.1][node.0] = true
                    for i in 0..<4 {
                        let nx = dx[i] + node.0
                        let ny = dy[i] + node.1
                        if 0..<m ~= nx && 0..<n ~= ny && graph[ny][nx] == 0 {
                            graph[ny][nx] = 2
                            queue.append((nx, ny))
                        }
                    }
                }
            }
        }
    }
    return graph.flatMap{$0}.filter{$0==0}.count
}

func findZeroPositions(in array: [[Int]]) -> [(Int, Int)] {
    var positions: [(Int, Int)] = []
    for x in 0..<m {
        for y in 0..<n {
            if array[y][x] == 0 {
                positions.append((x, y))
            }
        }
    }
    return positions
}

func combi(arr: [(Int, Int)], target: Int) -> [[(Int, Int)]]{
    var result = [[(Int, Int)]]()
    func combination(start: Int, current: [(Int, Int)]) {
        if current.count == target {
            result.append(current)
            return
        }
        for i in start..<arr.count {
            combination(start: i+1, current: current+[arr[i]])
        }
    }
    combination(start: 0, current: [])
    return result
}

let zeroCombi = combi(arr: findZeroPositions(in: tempGraph), target: 3)
var result = 0

for zeros in zeroCombi {
    zeros.forEach { (x,y) in
        graph[y][x] = 1
    }
    result = max(result, bfs())
    graph = tempGraph
}

print(result)