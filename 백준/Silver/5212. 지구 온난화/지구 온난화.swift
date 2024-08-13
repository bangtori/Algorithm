typealias Position = (x:Int, y:Int)

let len = readLine()!.split(separator: " ").map{Int($0)!}, (r, c) = (len[0], len[1])
var map = [[Character]]()
for _ in 1...r {
    map.append(Array(readLine()!))
}

func isSubmerged(pos: Position) -> Bool {
    let moves: [Position] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var count = 0
    for move in moves {
        let nx = pos.x + move.x
        let ny = pos.y + move.y
        
        if 0..<c ~= nx && 0..<r ~= ny {
            if map[ny][nx] == "." { count += 1 }
        } else {
            count += 1
        }
    }
    return count >= 3
}

var tempMap = map

for x in 0..<c {
    for y in 0..<r {
        if map[y][x] == "X" && isSubmerged(pos: (x,y)) {
            tempMap[y][x] = "."
        }
    }
}

// 유효한 영역의 최소/최대 행과 열을 찾는 부분
var minRow = r, maxRow = 0
var minCol = c, maxCol = 0

for y in 0..<r {
    for x in 0..<c {
        if tempMap[y][x] == "X" {
            minRow = min(minRow, y)
            maxRow = max(maxRow, y)
            minCol = min(minCol, x)
            maxCol = max(maxCol, x)
        }
    }
}

// 유효한 부분만 추출하여 최종 지도를 생성
let finalMap = tempMap[minRow...maxRow].map { Array($0[minCol...maxCol]) }

// 결과 출력
for row in finalMap {
    print(String(row))
}
