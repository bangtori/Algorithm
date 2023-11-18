import Foundation


func solution(_ stones:[Int], _ k:Int) -> Int {
  var left = 1, right = 200000000
    
    while left <= right {
        let mid = (left+right)/2
        var zeroCount = 0 
        for i in 0..<stones.count {
            if stones[i] - mid <= 0 {
                zeroCount += 1
            } else {
                zeroCount = 0
            }
            if zeroCount >= k {
                break
            }
        }
        if zeroCount >= k {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    return left
}