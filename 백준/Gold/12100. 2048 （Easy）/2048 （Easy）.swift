import Foundation

// 게임판을 이동시키는 함수
func move(_ board: [[Int]], _ direction: Int) -> [[Int]] {
    let n = board.count
    var newBoard = board

    switch direction {
    case 0: // 위로 이동
        for j in 0..<n {
            var temp = [Int]()
            for i in 0..<n {
                if newBoard[i][j] != 0 {
                    temp.append(newBoard[i][j])
                }
            }
            temp = merge(temp)
            for i in 0..<n {
                newBoard[i][j] = (i < temp.count) ? temp[i] : 0
            }
        }
    case 1: // 아래로 이동
        for j in 0..<n {
            var temp = [Int]()
            for i in stride(from: n-1, through: 0, by: -1) {
                if newBoard[i][j] != 0 {
                    temp.append(newBoard[i][j])
                }
            }
            temp = merge(temp)
            for i in stride(from: n-1, through: 0, by: -1) {
                newBoard[i][j] = (n-1-i < temp.count) ? temp[n-1-i] : 0
            }
        }
    case 2: // 왼쪽으로 이동
        for i in 0..<n {
            var temp = [Int]()
            for j in 0..<n {
                if newBoard[i][j] != 0 {
                    temp.append(newBoard[i][j])
                }
            }
            temp = merge(temp)
            for j in 0..<n {
                newBoard[i][j] = (j < temp.count) ? temp[j] : 0
            }
        }
    case 3: // 오른쪽으로 이동
        for i in 0..<n {
            var temp = [Int]()
            for j in stride(from: n-1, through: 0, by: -1) {
                if newBoard[i][j] != 0 {
                    temp.append(newBoard[i][j])
                }
            }
            temp = merge(temp)
            for j in stride(from: n-1, through: 0, by: -1) {
                newBoard[i][j] = (n-1-j < temp.count) ? temp[n-1-j] : 0
            }
        }
    default:
        break
    }

    return newBoard
}

// 블록을 합치는 함수
func merge(_ row: [Int]) -> [Int] {
    var mergedRow = [Int]()
    var skip = false

    for i in 0..<row.count {
        if skip {
            skip = false
            continue
        }

        if i < row.count - 1 && row[i] == row[i+1] {
            mergedRow.append(row[i] * 2)
            skip = true
        } else {
            mergedRow.append(row[i])
        }
    }

    return mergedRow
}

// 최대 블록을 찾는 함수
func findMaxBlock(_ board: [[Int]]) -> Int {
    var maxBlock = 0
    for row in board {
        for value in row {
            maxBlock = max(maxBlock, value)
        }
    }
    return maxBlock
}

// DFS로 모든 경우의 수를 탐색하는 함수
func dfs(_ board: [[Int]], _ count: Int) -> Int {
    if count == 5 {
        return findMaxBlock(board)
    }

    var maxBlock = 0

    for direction in 0..<4 {
        let newBoard = move(board, direction)
        maxBlock = max(maxBlock, dfs(newBoard, count + 1))
    }

    return maxBlock
}

// 입력 받기
let n = Int(readLine()!)!
var board = [[Int]]()

for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(row)
}

// 최대 블록 값 출력
print(dfs(board, 0))