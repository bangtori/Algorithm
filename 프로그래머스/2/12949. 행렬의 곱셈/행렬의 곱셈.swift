import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    var m = arr1.count, k = arr2.count, n = arr2[0].count
    for i in 0..<m {
        var partialArr: [Int] = []
        for j in 0..<n {
            var sum = 0
            for l in 0..<k {
                sum += arr1[i][l] * arr2[l][j]
            }
            partialArr.append(sum)
        }
        result.append(partialArr)
    }
    return result
}