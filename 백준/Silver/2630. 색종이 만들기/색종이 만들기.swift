let n = Int(readLine()!)!
var paper = [[Int]]()

for _ in 1...n {
    paper.append(readLine()!.split(separator: " ").map{Int($0)!})
}

func check(x: Int, y: Int, n: Int) -> Bool {
    let firstElement = paper[y][x]
    for i in x..<x+n {
        for j in y..<y+n {
            if paper[j][i] != firstElement {
                return false
            }
        }
    }
    return true
}

var whiteCount = 0
var blueCount = 0

func cuttingPaper(x: Int, y: Int, n: Int) {
    if n == 1 {
        if paper[y][x] == 1 {
            blueCount += 1
        } else {
            whiteCount += 1
        }
        return
    }
    
    if check(x: x, y: y, n: n) {
        if paper[y][x] == 1 {
            blueCount += 1
        } else {
            whiteCount += 1
        }
        return
    } else {
        cuttingPaper(x: x, y: y, n: n / 2)
        cuttingPaper(x: x + n / 2, y: y, n: n / 2)
        cuttingPaper(x: x, y: y + n / 2, n: n / 2)
        cuttingPaper(x: x + n / 2, y: y + n / 2, n: n / 2)
    }
}
cuttingPaper(x: 0, y: 0, n: n)
print(whiteCount)
print(blueCount)
