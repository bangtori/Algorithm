let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
arr.insert(0, at: 0) // 0번 인덱스 제거용
var visited = [Bool](repeating: false, count: n+1)

func dfs(current: [Int]) {
    func check(i: Int) -> Bool {
        var count = 0
        current.forEach { person in
            if i < person {
                count += 1
            }
        }
        return count == arr[i]
    }
    if current.count == n {
        print(current.map{String($0)}.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if !visited[i] && check(i: i) {
            visited[i] = true
            dfs(current: current+[i])
            visited[i] = false
        }
    }
    return
}

dfs(current: [])