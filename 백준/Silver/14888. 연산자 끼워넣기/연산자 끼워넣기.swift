let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var op = readLine()!.split(separator: " ").map{Int($0)!}

var maxNum: Int = Int.min
var minNum: Int = Int.max

func bfs(currentNumIndex: Int, op: [Int], result: Int) {
    if currentNumIndex == n {
        maxNum = max(result, maxNum)
        minNum = min(result, minNum)
        return
    }
    
    for (i, o) in op.enumerated() {
        if o != 0 {
            switch i {
            case 0:
                var newOp = op
                newOp[0] -= 1
                bfs(currentNumIndex: currentNumIndex + 1, op: newOp, result: result + arr[currentNumIndex])
            case 1:
                var newOp = op
                newOp[1] -= 1
                bfs(currentNumIndex: currentNumIndex + 1, op: newOp, result: result - arr[currentNumIndex])
            case 2:
                var newOp = op
                newOp[2] -= 1
                bfs(currentNumIndex: currentNumIndex + 1, op: newOp, result: result * arr[currentNumIndex])
            case 3:
                var newOp = op
                newOp[3] -= 1
                bfs(currentNumIndex: currentNumIndex + 1, op: newOp, result: result / arr[currentNumIndex])
            default :
                break
            }
        }
    }
}

bfs(currentNumIndex: 1, op: op, result: arr[0])
print(maxNum)
print(minNum)