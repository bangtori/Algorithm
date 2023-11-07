import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var count = 0
    var stack: [Int] = []
    
    for move in moves {
        for (i, b) in board.enumerated() {
            if b[move-1] != 0 {
                if stack.last == b[move-1] {
                    stack.popLast()
                    count += 2
                } else {
                    stack.append(b[move-1])
                }
                board[i][move-1] = 0
                break
            }
        }
    }
    return count
}