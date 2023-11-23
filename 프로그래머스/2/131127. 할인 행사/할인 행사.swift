import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var wantDic: [String: Int] = Dictionary()
    for i in 0..<want.count {
        wantDic[want[i]] = number[i]
    }
    var count = 0
    for start in 0..<discount.count {
        let end = start + 10 < discount.count ? start + 10 : discount.count
        var tempDic = wantDic
        for i in start..<end {
            if tempDic[discount[i]] != nil {
                tempDic[discount[i]]! -= 1
                if tempDic[discount[i]]! == 0 {
                    tempDic[discount[i]] = nil
                }
            }
        }
        if tempDic.isEmpty {
            count += 1
        }
    }
    return count
}