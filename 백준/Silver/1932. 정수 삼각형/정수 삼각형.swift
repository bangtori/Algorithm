let n = Int(readLine()!)!
var triangle = [[Int]]()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    triangle.append(input)
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
dp[0][0] = triangle[0][0]
for i in 1..<n {
    for (index, currentNum) in triangle[i].enumerated() {
        var left, right : Int?
        var result: Int
        if index-1 >= 0 {
            left = dp[i-1][index-1]
        }
        if index < i {
            right = dp[i-1][index]
        }
        
        if left != nil && right != nil {
            result = triangle[i][index] + max(left!, right!)
        } else if left != nil {
            result = triangle[i][index] + left!
        } else {
            result = triangle[i][index] + right!
        }

        dp[i][index] = result
    }
}

print(dp.last!.max()!)