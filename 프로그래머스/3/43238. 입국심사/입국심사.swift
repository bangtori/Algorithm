import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var low: Int64 = 1
    var high: Int64 = Int64(times.max()!) * Int64(n)
    
    var answer:Int64 = high
    
    while low <= high {
        let mid = (low + high) / 2
        
        var totalWorks: Int64 = 0
        for time in times {
            totalWorks += mid / Int64(time)
        }
        
        if totalWorks >= n {
            // 처리 가능
            answer = mid
            high = mid - 1
        } else {
            // 불가능
            low = mid + 1
        }
    }
    return answer
}
