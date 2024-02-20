let n = Int(readLine()!)!
var video = [[Int]]()

for _ in 1...n {
    let row = Array(readLine()!)
    video.append(row.map{Int(String($0))!})
}


func cuttingPaper(x: Int, y: Int, n: Int) -> String {
    func check() -> Bool {
        let firstElement = video[y][x]
        for i in x..<x+n {
            for j in y..<y+n {
                if video[j][i] != firstElement {
                    return false
                }
            }
        }
        return true
    }
    
    if n == 1 {
        if video[y][x] == 1 {
            return "1"
        } else {
            return "0"
        }
    }

    if check() {
        if video[y][x] == 1 {
            return "1"
        } else {
            return "0"
        }
    } else {
        let result1 = cuttingPaper(x: x, y: y, n: n / 2)
        let result2 = cuttingPaper(x: x + n / 2, y: y, n: n / 2)
        let result3 = cuttingPaper(x: x, y: y + n / 2, n: n / 2)
        let result4 = cuttingPaper(x: x + n / 2, y: y + n / 2, n: n / 2)
        return "(\(result1)\(result2)\(result3)\(result4))"
    }
}
print(cuttingPaper(x: 0, y: 0, n: n))