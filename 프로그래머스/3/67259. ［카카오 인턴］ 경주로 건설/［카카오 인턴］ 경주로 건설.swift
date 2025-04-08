import Foundation

typealias Position = (x: Int, y: Int)
enum Direction: CaseIterable {
    case up
    case down
    case left
    case right
    
    var axis: Character {
        switch self {
        case .up, .down:
            return "y"
        case .left, .right:
            return "x"
        }
    }
    
    var move: Position {
        switch self {
        case .up:
            return (0, 1)
        case .down:
            return (0, -1)
        case .left:
            return (-1, 0)
        case .right:
            return (1, 0)
        }
    }
}
func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    var costBoard = Array(
        repeating: Array(repeating: [Int](repeating: Int.max, count: 4), count: n),
        count: n
    )
    
    var queue: [(pos: Position, cost: Int, dir: Direction?)] = []
    
    for (i, direction) in Direction.allCases.enumerated() {
        let next = (x: 0 + direction.move.x, y: 0 + direction.move.y)
        if 0..<n ~= next.x && 0..<n ~= next.y && board[next.y][next.x] == 0 {
            costBoard[next.y][next.x][i] = 100
            queue.append((next, 100, direction))
        }
    }
    
    while !queue.isEmpty {
        let (currentPos, currentCost, currentDir) = queue.removeFirst()
        
        for (i, direction) in Direction.allCases.enumerated() {
            let nextPos = (x: currentPos.x + direction.move.x, y: currentPos.y + direction.move.y)
            if 0..<n ~= nextPos.x && 0..<n ~= nextPos.y && board[nextPos.y][nextPos.x] == 0 {
                let addCost = (currentDir!.axis == direction.axis ? 100 : 600)
                let newCost = currentCost + addCost
                if costBoard[nextPos.y][nextPos.x][i] > newCost {
                    costBoard[nextPos.y][nextPos.x][i] = newCost
                    queue.append((nextPos, newCost, direction))
                }
            }
        }
    }
    
    return costBoard[n-1][n-1].min()!
}