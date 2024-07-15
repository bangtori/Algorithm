let n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 1...n {
    graph.append(readLine()!.split(separator: " ").map{Int($0)!})
}
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
let blooming: [(x:Int, y:Int)] = [(0,0), (0,-1), (0,1), (-1,0), (1,0)] // 현재좌표, 상,하,좌,우
var minPrice = 100000
func planting(currentN: Int, price: Int, visite: [[Bool]]) {
    var tempVisite = visite
    func checkFlower(position: (x:Int, y: Int)) -> Bool {
        for i in blooming {
            let flowerX = position.x + i.x
            let flowerY = position.y + i.y
            if !(0..<n ~= flowerX && 0..<n ~= flowerY && !tempVisite[flowerY][flowerX]) {
                return false
            }
        }
        return true
    }
    if currentN > 3 {
        // 3개 다 심었으면 끝
        minPrice = min(minPrice, price)
        return
    }
    
    for x in 0..<n {
        for y in 0..<n {
            if checkFlower(position: (x, y)) {
                var currentPirce = 0
                for i in blooming {
                    let flowerX = x + i.x
                    let flowerY = y + i.y
                    currentPirce += graph[flowerY][flowerX]
                    tempVisite[flowerY][flowerX] = true
                }
                planting(currentN: currentN + 1, price: price + currentPirce, visite: tempVisite)
                
                for i in blooming {
                    let flowerX = x + i.x
                    let flowerY = y + i.y
                    tempVisite[flowerY][flowerX] = false
                }
            }
        }
    }
}

planting(currentN: 1, price: 0, visite: visited)
print(minPrice)
