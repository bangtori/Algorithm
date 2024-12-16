import Foundation

struct Position: Hashable {
    let x: Int
    let y: Int
    
    static func == (lhs: Position, rhs: Position) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    static func + (lhs: Position, rhs: Position) -> Position {
        Position(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    func checkValidPosition() -> Bool {
        if -5..<6 ~= self.x && -5..<6 ~= self.y {
            return true
        }
        return false
    }
}
struct Path: Hashable {
    let start: Position
    let end: Position
    
    static func == (lhs: Path, rhs: Path) -> Bool {
        return (lhs.start == rhs.start && lhs.end == rhs.end) ||
               (lhs.start == rhs.end && lhs.end == rhs.start)
    }
    
    func hash(into hasher: inout Hasher) {
        let orderedPositions = [start, end].sorted {
            $0.x < $1.x || ($0.x == $1.x && $0.y < $1.y)
        }
        hasher.combine(orderedPositions[0])
        hasher.combine(orderedPositions[1])
    }
}

func solution(_ dirs:String) -> Int {
    let directions: [Character: Position] = ["U": Position(x: 0, y: 1),
                                             "D": Position(x: 0, y: -1),
                                             "R": Position(x: 1, y: 0),
                                             "L": Position(x: -1, y: 0)]
    var visited: Set<Path> = []
    var currentLen = 0
    var currentPos = Position(x: 0, y: 0)
    for direction in dirs {
        guard let direction = directions[direction] else { continue }
        let nextPos = currentPos + direction
        if !nextPos.checkValidPosition() { continue }
        let path = Path(start: currentPos, end: nextPos)
        
        if !visited.contains(path) {
            currentLen += 1
            visited.insert(path)
        }
        currentPos = nextPos
    }
    return currentLen
}