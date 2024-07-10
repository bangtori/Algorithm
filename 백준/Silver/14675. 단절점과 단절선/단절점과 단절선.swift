let n = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: n+1)
for _ in 1..<n {
    let edge = readLine()!.split(separator: " ").map{Int($0)!}
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}

let q = Int(readLine()!)!
for _ in 1...q {
    let qi = readLine()!.split(separator: " ").map{Int($0)!}
    let (t, k) = (qi[0], qi[1])
    
    if t == 1 {
        if graph[k].count < 2 {
            print("no")
        } else {
            print("yes")
        }
    } else {
        print("yes")
    }
}