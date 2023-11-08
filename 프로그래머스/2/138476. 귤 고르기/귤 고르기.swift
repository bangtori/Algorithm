import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dic: [Int: Int] = Dictionary()
    for i in tangerine {
        if let current = dic[i] {
            dic[i] = current + 1
        } else {
            dic[i] = 1
        }
    }
    var count = 0
    var k = k
    for i in dic.values.sorted(by: >) {
        k -= i
        count += 1
        if k <= 0 {
            break
        }
    }
    return count
}