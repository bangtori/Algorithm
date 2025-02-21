func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var parent = Array(0..<n)
    let sortedCosts = costs.sorted{$0[2] < $1[2]}
    
    func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }
    var sum = 0
    sortedCosts.forEach { cost in
        let rootA = find(cost[0])
        let rootB = find(cost[1])
        
        if rootA != rootB {
            // 다른 집합이므로 합치기
            parent[rootA] = rootB
            sum += cost[2]
        }
    }
    
    return sum
}