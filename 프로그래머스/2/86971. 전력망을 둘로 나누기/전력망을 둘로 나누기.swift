import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var graph: [Int: [Int]] = Dictionary()
    var min = Int.max
    for wire in wires {
        let (n, m) = (wire[0], wire[1])
        if graph[n] != nil {
            graph[n]!.append(m)
        } else {
            graph[n] = [m]
        }
        if graph[m] != nil {
            graph[m]!.append(n)
        } else {
            graph[m] = [n]
        }
    }
 
    func bfs(_ start: Int) -> Int {
        var queue: [Int] = [start]
        var count = 0
        var visit = Array(repeating: false, count: n+1)
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            count += 1
            
            visit[node] = true
            for node in graph[node]! {
                if !visit[node] {
                    queue.append(node)
                }
            }
        }
        return count
    }
    
    for i in 1...n {
        for j in graph[i]! {
            graph[i] = graph[i]!.filter{$0 != j}
            graph[j] = graph[j]!.filter{$0 != i}
            
            let distance = abs(bfs(i) - bfs(j))
            
            min = distance < min ? distance : min
            
            graph[i]?.append(j)
            graph[j]?.append(i)
        }
    }
    return min
}





