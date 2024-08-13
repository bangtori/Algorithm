import Foundation


let gridSize = 101
var grid = Array(repeating: Array(repeating: false, count: gridSize), count: gridSize)

let dx = [1, 0, -1, 0]
let dy = [0, -1, 0, 1]

// 드래곤 커브를 그리는 함수
func drawDragonCurve(x: Int, y: Int, d: Int, g: Int) {
    var directions = [d]
    
    for _ in 0..<g {
        let count = directions.count
        for i in stride(from: count - 1, through: 0, by: -1) {
            directions.append((directions[i] + 1) % 4)
        }
    }
    

    var currentX = x
    var currentY = y
    grid[currentX][currentY] = true
    
    
    for direction in directions {
        currentX += dx[direction]
        currentY += dy[direction]
        grid[currentX][currentY] = true
    }
}


let n = Int(readLine()!)!
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let x = input[0]
    let y = input[1]
    let d = input[2]
    let g = input[3]
    drawDragonCurve(x: x, y: y, d: d, g: g)
}


var squareCount = 0
for i in 0..<gridSize - 1 {
    for j in 0..<gridSize - 1 {
        if grid[i][j] && grid[i+1][j] && grid[i][j+1] && grid[i+1][j+1] {
            squareCount += 1
        }
    }
}

print(squareCount)