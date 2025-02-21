import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    func bfs(graph: [Int: [Int]]) -> Bool {
        var visited = [Bool](repeating: false, count: n)
        var queue = [Int]()
        visited[0] = true
        graph[0]!.forEach {
            queue.append($0)
            visited[$0] = true
        }
        var index = 0
        while index < queue.count {
            let node = queue[index]
            index += 1
            for next in graph[node] ?? [] {
                if !visited[next] {
                    visited[next] = true
                    queue.append(next)
                }
            }
        }
        return visited.filter{!$0}.isEmpty
    }
    var graph = [Int: [Int]]()
    for cost in costs {
        graph[cost[0], default: []].append(cost[1])
        graph[cost[1], default: []].append(cost[0])
    }
    let sortCosts = costs.sorted {
        return $0[2] > $1[2]
    }
    var sum = 0
    for cost in sortCosts {
        var newGraph = graph
        if let index1 = newGraph[cost[0]]?.firstIndex(of: cost[1]), let index0 = newGraph[cost[1]]?.firstIndex(of: cost[0]) {
            newGraph[cost[0]]?.remove(at: index1)
            newGraph[cost[1]]?.remove(at: index0)
        }
        if bfs(graph: newGraph) {
            // 제거 가능
            graph = newGraph
        } else {
            sum += cost[2]
        }
    }
    return sum
}
