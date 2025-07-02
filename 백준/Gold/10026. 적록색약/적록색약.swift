import Foundation
typealias Position = (x: Int, y: Int)
let n = Int(readLine()!)!
let normalGrid: [[Character]] = (0..<n).map { _ in Array(readLine()!) }
let colorWeakGrid = normalGrid.map { row in
    row.map { char in
        char == "R" ? "G" : char
    }
}

func getCount(grid: [[Character]]) -> Int {
    let moves: [Position] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    
    func bfs(_ start: Position) {
        var head = 0
        var queue = [Position]()
        queue.append(start)
        visited[start.y][start.x] = true
        while head < queue.count {
            let current = queue[head]
            head += 1
            for move in moves {
                let next: Position = (current.x + move.x, current.y + move.y)
                if 0..<n ~= next.x, 0..<n ~= next.y, grid[next.y][next.x] == grid[current.y][current.x], !visited[next.y][next.x] {
                    queue.append(next)
                    visited[next.y][next.x] = true
                }
            }
        }
    }
    
    var count = 0
    for x in 0..<n {
        for y in 0..<n {
            if !visited[y][x] {
                bfs((x, y))
                count += 1
            }
        }
    }
    return count
}
print("\(getCount(grid: normalGrid)) \(getCount(grid: colorWeakGrid))")