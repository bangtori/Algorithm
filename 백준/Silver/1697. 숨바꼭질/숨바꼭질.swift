let info = readLine()!.split(separator: " ").map{Int($0)!}
var visited = Array(repeating: 0, count: 100_001)

var queue: [Int] = [info[0]]

while !queue.isEmpty {
    let current = queue.removeFirst()

    if current == info[1] {
        print(visited[current])
        break
    }
    
    let next = [current-1, current+1, current*2]
    for node in next {
        if 0..<100_001 ~= node, visited[node] == 0 {
            visited[node] = visited[current] + 1
            queue.append(node)
        }
    }
}