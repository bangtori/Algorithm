let info = readLine()!.split(separator: " ").map{Int($0)!}
var dict: [Int:[Int]] = [:]

for _ in 0..<info[1]{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    dict[line[0], default: []].append(line[1])
    dict[line[1], default: []].append(line[0])
}

var visited = [Bool](repeating: false, count: info[0]+1)
var count = 0

func bfs(start: Int) {
    var queue = [start]
    var head = 0
    visited[start] = true
    
    while queue.count > head {
        let now = queue[head]
        head += 1
        for next in dict[now] ?? [] {
            if !visited[next] {
                queue.append(next)
                visited[next] = true
            }
        }
    }
}
for i in 1...info[0]{
    if !visited[i] {
        count += 1
        bfs(start: i)
    }
}

print(count)
