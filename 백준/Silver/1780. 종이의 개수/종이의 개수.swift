let n = Int(readLine()!)!
var paper = [[Int]]()

for _ in 1...n {
//    let row = Array(readLine()!) -> 시간 초과
    let row = readLine()!
    paper.append(row.split(separator: " ").map{Int(String($0))!})
}

var counts = [0,0,0] // -1, 0, 1 순서
func cuttingPaper(x: Int, y: Int, n: Int) {
    func check() -> Bool {
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

    if n == 1 {
        if paper[y][x] == -1 {
            counts[0] = counts[0] + 1
            return
        } else if paper[y][x] == 0 {
            counts[1] = counts[1] + 1
            return
        } else {
            counts[2] = counts[2] + 1
            return
        }
    }

    if check() {
        if paper[y][x] == -1 {
            counts[0] = counts[0] + 1
            return
        } else if paper[y][x] == 0 {
            counts[1] = counts[1] + 1
            return
        } else {
            counts[2] = counts[2] + 1
            return
        }
    } else {
        let nextN = n / 3
        cuttingPaper(x: x, y: y, n: nextN)
        cuttingPaper(x: x + nextN, y: y, n: nextN)
        cuttingPaper(x: x + 2 * nextN, y: y, n: nextN)
        
        cuttingPaper(x: x, y: y + nextN, n: nextN)
        cuttingPaper(x: x + nextN, y: y + nextN, n: nextN)
        cuttingPaper(x: x + 2 * nextN, y: y + nextN, n: nextN)
        
        cuttingPaper(x: x, y: y + 2 * nextN, n: nextN)
        cuttingPaper(x: x + nextN, y: y + 2 * nextN, n: nextN)
        cuttingPaper(x: x + 2 * nextN, y: y + 2 * nextN, n: nextN)
    }
}
cuttingPaper(x: 0, y: 0, n: n)
counts.map {
    print($0)
}
