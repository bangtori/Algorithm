import Foundation

typealias Position = (x: Int, y: Int)

enum Direction {
    case down
    case right
    case up
    
    var next: Direction {
        switch self {
        case .down:
            return .right
        case .right:
            return .up
        case .up:
            return .down
        }
    }
    
    var move: Position {
        switch self {
        case .down:
            return (0, 1)
        case .right:
            return (1, 0)
        case .up:
            return (-1, -1)
        }
    }
}
func solution(_ n:Int) -> [Int] {
    var result = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var currentDirection: Direction = .down
    var currentCount = 0
    var changeCount = 0
    var totalCount = 1
    var currentPostion: Position = (0,0)
    
    while changeCount < n {
        result[currentPostion.y][currentPostion.x] = totalCount
        totalCount += 1
        currentCount += 1
        let currentTarget = n - changeCount
        if currentTarget == currentCount {
            currentCount = 0
            changeCount += 1
            currentDirection = currentDirection.next
        }
        currentPostion = (currentPostion.x + currentDirection.move.x, currentPostion.y + currentDirection.move.y)
    }
        
    var oneArray = [Int]()
    for y in 0..<n {
        for x in 0..<n {
            if result[y][x] != 0 {
                oneArray.append(result[y][x])
            }
        }
    }
    return oneArray
}