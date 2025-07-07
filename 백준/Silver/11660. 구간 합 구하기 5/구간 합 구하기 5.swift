typealias Position = (x: Int, y: Int)
let info = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (info[0], info[1])
var table = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
for i in 1...n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 1...n {
        table[i][j] = line[j - 1]
    }
}


var prefix = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)

for i in 1...n {
    for j in 1...n {
        prefix[i][j] = prefix[i - 1][j] + prefix[i][j - 1] - prefix[i - 1][j - 1] + table[i][j]
    }
}



for _ in 1...m {
    let query = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1, y1, x2, y2) = (query[0], query[1], query[2], query[3])
    
    let result = prefix[x2][y2]
               - prefix[x1 - 1][y2]
               - prefix[x2][y1 - 1]
               + prefix[x1 - 1][y1 - 1]
    
    print(result)
    
}