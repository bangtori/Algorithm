import Foundation
var l = readLine()!.split(separator: " ").map { Int($0)! }
var n = l[0]
var e = l[1]
var map = Array(repeating: [(Int, Int)](), count: n+1) // (start, (end, value))
var d = [Int]()
var intMax = 987654321
for _ in 0..<e {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let a = line[0]
    let b = line[1]
    let value = line[2]
    map[a].append((b, value))
    map[b].append((a, value))
}

var need = readLine()!.split(separator: " ").map { Int($0)! }

func dijikstra(start: Int, end: Int) -> Int {
    d = Array(repeating: intMax, count: n+1)
    d[start] = 0
    var qu = [(Int, Int)]()
    qu.append((0, start)) // 거리, 시작점
    
    while !qu.isEmpty {
        var cost = qu.first!.0
        var now = qu.first!.1
        qu.removeFirst()
        
        for i in map[now] {
            var c = cost + i.1
            if d[i.0] > c {
                d[i.0] = c
                qu.append((c, i.0))
            }
        }
    }
    return d[end]
    
}

func check() -> Int {
    var minValue = intMax
    var start = dijikstra(start: 1, end: need[0])
    start = start == intMax ? -1 : start

    var middle = dijikstra(start: need[0], end: need[1])
    middle = middle == intMax ? -1 : middle
    var end = dijikstra(start: n, end: need[1])
    end = end == intMax ? -1 : end
    if start != -1 && middle != -1 && end != -1 {
        minValue = start + middle + end
    }
    
    var start1 = dijikstra(start: 1, end: need[1])
    start1 = start1 == intMax ? -1 : start1

    var end1 = dijikstra(start: n, end: need[0])
    end1 = end1 == intMax ? -1 : end1
    
    if start1 != -1 && middle != -1 && end1 != -1 {
        minValue = min(minValue, start1 + middle + end1)
    }
    return minValue == intMax ? -1 : minValue
}

print(check())
