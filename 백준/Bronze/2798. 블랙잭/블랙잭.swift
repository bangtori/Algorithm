let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input[0], input[1])
let arr = readLine()!.split(separator: " ").map{Int($0)!}

var result = 0
func bfs(index: Int, currentSum: Int, count: Int) {
    if count == 3 {
        if currentSum <= m && m - result > m - currentSum {

            result = currentSum
        }
        return
    }
    
    for i in index..<arr.count {
        bfs(index: i+1, currentSum: currentSum + arr[i], count: count + 1)
    }
}

bfs(index: 0, currentSum: 0, count: 0)
print(result)