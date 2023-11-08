import Foundation

func permute<T>(_ nums: [T], _ targetNum: Int) -> [[T]] {
    //nums : 배열, targetNum: 조합할 원소 수
    var result = [[T]]()
    var visited = [Bool](repeating: false, count: nums.count)
    
    func permutation(_ nowPermute: [T]) {
        if nowPermute.count == targetNum {
            result.append(nowPermute)
            return
        }
        for i in 0..<nums.count {
            if visited[i] == true {
                continue
            }
            else {
                visited[i] = true
                permutation(nowPermute + [nums[i]])
                visited[i] = false
            }
        }
    }
    permutation([])
    
    return result
}
func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    let p = permute(dungeons, dungeons.count)
    var maxCount = 0
    for i in p {
        var k = k
        var count = 0
        for j in i {
            if k < j[0] {
                continue
            } else {
                k -= j[1]
                count += 1
            }
        }
        maxCount = max(maxCount, count)
    }
    return maxCount
}