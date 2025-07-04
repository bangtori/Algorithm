import Foundation

struct Position {
    let x: Int
    let y: Int

    func getDistance(_ other: Position) -> Int {
        return abs(x - other.x) + abs(y - other.y)
    }
}

let info = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (info[0], info[1])

var map = [[Int]]()
for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var houses: [Position] = []
var chickens: [Position] = []

for y in 0..<n {
    for x in 0..<n {
        if map[y][x] == 1 {
            houses.append(Position(x: x, y: y))
        } else if map[y][x] == 2 {
            chickens.append(Position(x: x, y: y))
        }
    }
}

var minCityChickenDistance = Int.max

func combi(_ index: Int, _ selected: [Position]) {
    if selected.count == m {
        var totalDistance = 0

        for house in houses {
            var minDistance = Int.max
            for chicken in selected {
                minDistance = min(minDistance, house.getDistance(chicken))
            }
            totalDistance += minDistance
        }

        minCityChickenDistance = min(minCityChickenDistance, totalDistance)
        return
    }

    for i in index..<chickens.count {
        combi(i + 1, selected + [chickens[i]])
    }
}

combi(0, [])
print(minCityChickenDistance)