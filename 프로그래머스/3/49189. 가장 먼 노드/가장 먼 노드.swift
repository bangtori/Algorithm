import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph: [Int: [Int]] = [:]
    var distance = [Int](repeating: Int.max, count: n+1)
    distance[0] = 0
    distance[1] = 0
    for info in edge {
        let (v1, v2) = (info[0], info[1])
        graph[v1, default: []].append(v2)
        graph[v2, default: []].append(v1)
    }
    
    func bfs() {
        var queue = [(node: Int, distance: Int)]()
        var index = 0
        
        queue.append((1, distance[1]))
        
        while index < queue.count {
            let node = queue[index]
            index += 1
            
            for i in graph[node.node] ?? [] {
                if distance[i] > node.distance + 1 {
                    distance[i] = node.distance + 1
                    queue.append((i, distance[i]))
                }
            }
        }
    }
    bfs()
    let maxValue = distance.max() ?? 0
    
    return distance.filter { $0 == maxValue }.count
}