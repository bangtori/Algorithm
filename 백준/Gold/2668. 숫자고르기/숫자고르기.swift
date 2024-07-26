
let n = Int(readLine()!)!
var graph = Dictionary(uniqueKeysWithValues: (1...n).map { ($0, [Int]()) })

for i in 1...n {
    let input = Int(readLine()!)!
    graph[input]!.append(i)
}
var node = [Int]()
var visited = [Bool](repeating: false, count: n+1)
func find(_ currentIndex: Int, _ start: Int) {
    visited[currentIndex] = true
    guard let list = graph[currentIndex] else { return }
    
    for i in list {
        if !visited[i] {
            find(i, start)
        } else if visited[i] && i == start {
            node.append(i)
        }
    }
}

for i in 1...n {
    visited = [Bool](repeating: false, count: n+1)
    find(i, i)
}
let result = Array(Set(node)).sorted()
print(result.count)
result.map{print($0)}