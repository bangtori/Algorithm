import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    func combi(order: String, target: Int) -> [String] {
        let arr = Array(order).sorted()
        var result = [String]()
        func combination(current: [Character], index: Int) {
            if current.count == target {
                result.append(String(current))
                return
            }
            for i in index..<order.count {
                combination(current: current + [arr[i]], index: i+1)
            }
        }
        combination(current: [], index: 0)
        return result
    }
    
    var courseCount = [String: Int]()
    var maxCountPerCourse = [Int: Int]()
    for num in course {
        for order in orders {
            if order.count < num { continue }
            let orderCombis = combi(order: order, target: num)
            orderCombis.forEach { orderCombi in
                courseCount[orderCombi, default: 0] += 1
                maxCountPerCourse[num] = max(maxCountPerCourse[num] ?? 0, courseCount[orderCombi]!)
            }
        }
    }
    let result = courseCount
        .filter { (key, value) in value >= 2 && value == maxCountPerCourse[key.count] }
        .map { $0.key }
        .sorted()
    
    return result
}