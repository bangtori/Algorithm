import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result:[Int] = []
    var workingPeriods: [Int] = progresses.enumerated().map{ (i, progress) in
        if (100 - progress) % speeds[i] != 0 {
            return (100 - progress) / speeds[i] + 1
        } else {
            return (100 - progress) / speeds[i]
        }
    }
    var count = 0
    var current = 0
    while !workingPeriods.isEmpty {
        if current >= workingPeriods.first! {
            count += 1
            workingPeriods.removeFirst()
        } else {
            if count > 0 {
                result.append(count)
            }
            current = workingPeriods.removeFirst()
            count = 1
        }
    }
    if count > 0 {
        result.append(count)
    }
    return result
}