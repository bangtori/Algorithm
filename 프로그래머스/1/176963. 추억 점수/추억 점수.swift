import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var dic = [String: Int]()
    for i in 0..<name.count {
        dic[name[i]] = yearning[i]
    }
    var result: [Int] = []
    for names in photo {
        var sum = 0
        for i in names {
            if let score = dic[i] {
                sum += score
            }
        }
        result.append(sum)
    }
    return result
}