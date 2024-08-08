let n = Int(readLine()!)!

func promising(current: [Int], position: Int) -> Bool {
    if current.contains(position) {
        return false
    }
    for i in 0..<current.count {
        if abs(i-current.count) == abs(current[i]-position) {
            return false
        }
    }
    return true
}

var count = 0
func back(currentBoard: [Int]) {
    if currentBoard.count == n {
        count += 1
        return
    }
    for i in 0..<n {
        if promising(current: currentBoard, position: i) {
            back(currentBoard: currentBoard + [i])
        }
    }
}
back(currentBoard: [])
print(count)