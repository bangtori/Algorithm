let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m, r) = (input[0], input[1], input[2]) // n: 정점, m: 간선, r: 시작 정점
var visited = [Bool](repeating: false, count: n+1)
var graph = [Int: [Int]]()
var result = [Int](repeating: 0, count: n)
var queue = [Int]()
var dfsResult = [Int]()
var bfsResult = [Int]()

for _ in 1...m {
    let uv = readLine()!.split(separator: " ").map{ Int($0)! }
    if graph[uv[0]] == nil {
        graph[uv[0]] = [uv[1]]
    } else {
        graph[uv[0]]!.append(uv[1])
    }

    if graph[uv[1]] == nil {
        graph[uv[1]] = [uv[0]]
    } else {
        graph[uv[1]]!.append(uv[0])
    }
}

func dfs(_ start: Int) {
    visited[start] = true
    dfsResult.append(start)
    if let current = graph[start] {
        for i in current.sorted(by: <) {
            if visited[i] == false { dfs(i) }
        }
    }
}

func bfs(_ start: Int) {
    var index = 0
    queue.append(start)

    while queue.count > index {
        let node = queue[index]
        index += 1
        if visited[node] { continue }

        visited[node] = true
        bfsResult.append(node)
        if let currentGraph = graph[node] {
            queue.append(contentsOf: currentGraph.sorted(by: <))
        }
    }
}
dfs(r)
visited = [Bool](repeating: false, count: n+1)
bfs(r)
print(dfsResult.map{String($0)}.joined(separator: " "))
print(bfsResult.map{String($0)}.joined(separator: " "))