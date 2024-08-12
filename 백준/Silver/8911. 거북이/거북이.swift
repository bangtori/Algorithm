typealias Position = (x:Int, y:Int)
enum Direction {
    case up
    case down
    case right
    case left
    
    func moveForward(pos: Position) -> Position {
        switch self {
        case .up:
            return (pos.x, pos.y + 1)
        case .down:
            return (pos.x, pos.y - 1)
        case .right:
            return (pos.x + 1, pos.y)
        case .left:
            return (pos.x - 1, pos.y)
        }
    }
    func moveBack(pos: Position) -> Position {
        switch self {
        case .up:
            return (pos.x, pos.y - 1)
        case .down:
            return (pos.x, pos.y + 1)
        case .right:
            return (pos.x - 1, pos.y)
        case .left:
            return (pos.x + 1, pos.y)
        }
    }
    var leftRotation: Direction {
        switch self {
        case .up:
            return .left
        case .down:
            return .right
        case .right:
            return .up
        case .left:
            return .down
        }
    }
    
    var rightRotation: Direction {
        switch self {
        case .up:
            return .right
        case .down:
            return .left
        case .right:
            return .down
        case .left:
            return .up
        }
    }
}
let t = Int(readLine()!)!

for _ in 1...t {
    var (maxX, maxY, minX, minY) = (0,0,0,0)
    let commands = Array(readLine()!.map{String($0)})
    var currentDirection: Direction = .up
    var currentPosition: Position = (0,0)
    for command in commands {
        switch command {
        case "F":
            currentPosition = currentDirection.moveForward(pos: currentPosition)
            maxX = max(maxX, currentPosition.x)
            maxY = max(maxY, currentPosition.y)
            minX = min(minX, currentPosition.x)
            minY = min(minY, currentPosition.y)
        case "B":
            currentPosition = currentDirection.moveBack(pos: currentPosition)
            maxX = max(maxX, currentPosition.x)
            maxY = max(maxY, currentPosition.y)
            minX = min(minX, currentPosition.x)
            minY = min(minY, currentPosition.y)
        case "L":
            currentDirection = currentDirection.leftRotation
        case "R":
            currentDirection = currentDirection.rightRotation
        default:
            break
        }
    }
    
    let result = (maxX-minX) * (maxY-minY)
    print(result)
}