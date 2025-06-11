import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    var diffBoard = [[Int]](repeating: [Int](repeating: 0, count: board[0].count + 1), count: board.count + 1)
    
    for skillSet in skill {
        let (r1, c1) = (skillSet[1], skillSet[2])
        let (r2, c2) = (skillSet[3], skillSet[4])
        let degree = skillSet[0] == 1 ? (-1*skillSet[5]) : skillSet[5]
        
        // 경계선 표시
        diffBoard[r1][c1] += degree
        diffBoard[r2+1][c2+1] += degree
        diffBoard[r1][c2+1] -= degree
        diffBoard[r2+1][c1] -= degree
    }
    

    // 누적합 구하기
    for r in 0..<diffBoard.count {
        for c in 1..<diffBoard[0].count {
            diffBoard[r][c] += diffBoard[r][c-1]
        }
    }
    for c in 0..<diffBoard[0].count {
        for r in 1..<diffBoard.count {
            diffBoard[r][c] += diffBoard[r-1][c]
        }
    }
    
    // 기존값과 병합
    var board = board
    for r in 0..<board.count {
        for c in 0..<board[0].count {
            board[r][c] += diffBoard[r][c]
        }
    }

    return board.flatMap{$0}.filter { $0 > 0 }.count
}