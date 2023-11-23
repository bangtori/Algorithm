import Foundation

func solution(_ s:String) -> [Int] {
    var zeroCount = 0
    var transCount = 0
    var s = s
    while s != "1" {
        let result = transform(s)
        transCount += 1
        s = result.result
        zeroCount += result.count
    }
    return [transCount, zeroCount]
}

func transform(_ s: String) -> (count: Int, result: String) {
    var count = 0
    let s = s.filter {
        if $0 == "0" {
            count += 1
            return false
        } else {
            return true
        }
    }
    var binary = String(s.count, radix: 2)
    return (count, binary)
}