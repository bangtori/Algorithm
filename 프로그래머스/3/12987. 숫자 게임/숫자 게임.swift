import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var sortedA = a.sorted(by: <)
    var sortedB = b.sorted(by: >)
    var result = 0
    for target in sortedA {
        while let minValue = sortedB.popLast() {
            if minValue > target {
                result += 1
                break
            }
        }
    }
    return result
}