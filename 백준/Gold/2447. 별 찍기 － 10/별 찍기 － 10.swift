import Foundation

let n = Int(readLine()!)!
var board = Array(repeating: Array(repeating: " ", count: n), count: n)

func fillStar(x: Int, y: Int, size: Int) {
    if size == 1 {
        board[y][x] = "*"
        return
    }
    
    let newSize = size / 3
    for dy in 0..<3 {
        for dx in 0..<3 {
            if dx == 1 && dy == 1 { continue }
            fillStar(x: x + dx * newSize, y: y + dy * newSize, size: newSize)
        }
    }
}

fillStar(x: 0, y: 0, size: n)

for row in board {
    print(row.joined())
}