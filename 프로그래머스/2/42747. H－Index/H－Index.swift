import Foundation

func solution(_ citations:[Int]) -> Int {
    let sortedArr = citations.sorted(by: >)
    for (i, citation) in sortedArr.enumerated() {
        if citation <= i {
            return i
        }
    }
    return citations.count
}