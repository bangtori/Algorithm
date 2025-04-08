import Foundation
func getCollatzConjecture(_ k: Int) -> [Int] {
    var result = [Int]()
    result.append(k)
    var num = k
    while num > 1 {
        if num % 2 == 0 {
            num = num / 2
        } else {
            num = 3 * num + 1
        }
        result.append(num)
    }
    return result
}
func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    let collatzList = getCollatzConjecture(k)
    var extents: [Double] = [0.0]
    for i in 1..<collatzList.count {
        let current = Double(collatzList[i])
        let pre = Double(collatzList[i-1])
        let extent = min(pre, current) + abs(current-pre) / 2.0
        extents.append(extent)
    }
    var result = [Double]()
    for range in ranges {
        let start = range[0]+1
        let end = collatzList.count + range[1]
        
        if start > end {
            result.append(-1.0)
            continue
        }
        result.append(extents[start..<end].reduce(0.0, +))
    }
    return result
}