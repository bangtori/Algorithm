// 층 순열 뽑기
func permute(_ nums: [Int], _ targetNum: Int) -> [[Int]] {
    var result = [[Int]]()
    var visited = [Bool](repeating: false, count: nums.count)
    
    func permutation(_ nowPermute: [Int]) {
        if nowPermute.count == targetNum {
            result.append(nowPermute)
            return
        }
        for i in 0..<nums.count {
            if visited[i] == true {
                continue
            }
            else {
                visited[i] = true
                permutation(nowPermute + [nums[i]])
                visited[i] = false
            }
        }
    }
    permutation([])
    
    return result
}
// 4가지 방향으로 회전한 미로를 반환하는 함수
func rotate(_ board: [[Int]]) -> [[[Int]]] {
    var rotations = [[[Int]]]()
    rotations.append(board)
    var currentBoard = board
    for _ in 0..<3 {
        var newBoard = Array(repeating: Array(repeating: 0, count: 5), count: 5)
        for i in 0..<5 {
            for j in 0..<5 {
                newBoard[j][4-i] = currentBoard[i][j]
            }
        }
        currentBoard = newBoard
        rotations.append(newBoard)
    }
    return rotations
}

// BFS로 최단 경로를 찾는 함수
func bfs(_ cube: [[[Int]]]) -> Int {
    let directions = [(1,0,0), (-1,0,0), (0,1,0), (0,-1,0), (0,0,1), (0,0,-1)]
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 5), count: 5), count: 5)
    var queue: [(Int, Int, Int, Int)] = [(0, 0, 0, 0)]
    visited[0][0][0] = true
    
    while !queue.isEmpty {
        let (z, y, x, steps) = queue.removeFirst()
        
        if z == 4 && y == 4 && x == 4 {
            return steps
        }
        
        for direction in directions {
            let nz = z + direction.0
            let ny = y + direction.1
            let nx = x + direction.2
            
            if 0..<5 ~= nz && 0..<5 ~= ny && 0..<5 ~= nx {
                if !visited[nz][ny][nx] && cube[nz][ny][nx] == 1 {
                    visited[nz][ny][nx] = true
                    queue.append((nz, ny, nx, steps + 1))
                }
            }
        }
    }
    
    return Int.max
}
let floorPermute = permute([0,1,2,3,4], 5)
var minSteps = Int.max
func solve(_ boards: [[[[Int]]]]) -> Int {
    let floorPermute = permute([0,1,2,3,4], 5)
    var minSteps = Int.max
    
    for perm in floorPermute {
        var cube = Array(repeating: [[Int]](), count: 5)
        for i in 0..<5 {
            cube[i] = boards[perm[i]][0]
        }
        for r1 in 0..<4 {
            for r2 in 0..<4 {
                for r3 in 0..<4 {
                    for r4 in 0..<4 {
                        for r5 in 0..<4 {
                            let rotatedCube = [boards[perm[0]][r1], boards[perm[1]][r2], boards[perm[2]][r3], boards[perm[3]][r4], boards[perm[4]][r5]]
                            if rotatedCube[0][0][0] == 1 && rotatedCube[4][4][4] == 1 {
                                minSteps = min(minSteps, bfs(rotatedCube))
                            }
                        }
                    }
                }
            }
        }
    }
    
    return minSteps == Int.max ? -1 : minSteps
}

var boards = [[[[Int]]]]()

for _ in 1...5 {
    var board = [[Int]]()
    for _ in 1...5 {
        board.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    boards.append(rotate(board))
}

let result = solve(boards)
print(result)
