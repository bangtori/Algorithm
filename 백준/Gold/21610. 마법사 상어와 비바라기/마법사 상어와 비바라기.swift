func isWithinMap(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && x < n && y >= 0 && y < n
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
var map = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(input)
}

var clouds = [(n-1, 0), (n-1, 1), (n-2, 0), (n-2, 1)]

// ←, ↖, ↑, ↗, →, ↘, ↓, ↙
let dx = [0, 0, -1, -1, -1, 0, 1, 1, 1]
let dy = [0, -1, -1, 0, 1, 1, 1, 0, -1]

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (d, s) = (input[0], input[1])
    var cloudsMoved = [(Int, Int)]()
    
//  모든 구름이 d 방향으로 s칸 이동한다. (1번 행과 N번 행, 1번 열과 N번 열이 연결되어있음)
    for (x, y) in clouds {
        var nx = (x + dx[d] * s) % n
        var ny = (y + dy[d] * s) % n
        if nx < 0 { nx += n }
        if ny < 0 { ny += n }
        cloudsMoved.append((nx, ny))
    }
    
//  구름이 있는 칸의 바구니에 저장된 물의 양이 1 증가
    for (x, y) in cloudsMoved {
        map[x][y] += 1
    }
    
//  물이 증가한 칸에 대각선 방향으로 거리가 1인 칸에 "물이 있는 / 바구니의 수만큼" 물 증가
    for (x, y) in cloudsMoved {
        var count = 0
        for i in stride(from: 2, through: 8, by: 2) {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if isWithinMap(nx, ny) && map[nx][ny] > 0 {
                count += 1
            }
        }
        map[x][y] += count
    }
    
//  바구니에 저장된 물의 양이 2 이상인 모든 칸에 구름이 생기고, 물의 양이 2 줄어듦.
//  이때 구름이 생기는 칸은 3에서 구름이 사라진 칸이 아니어야 한다.
    var newClouds = [(Int, Int)]()
    for x in 0..<n {
        for y in 0..<n {
            if map[x][y] >= 2 && !cloudsMoved.contains(where: { $0 == (x, y) }) {
                map[x][y] -= 2
                newClouds.append((x, y))
            }
        }
    }
    clouds = newClouds
}

var sum = 0
for x in 0..<n {
    for y in 0..<n {
        sum += map[x][y]
    }
}
print(sum)