import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    enum Calc {
        case plus
        case minus
    }
    var startPointer: Int = 0
    var endPointer: Int = 0
    var sum = sequence[0]
    var result = [Int]()
    
    
    func calcSum(calc: Calc) -> Int {
        if startPointer >= sequence.count || endPointer >= sequence.count || startPointer > endPointer {
            return sum
        }
        if calc == .plus {
            return sum + sequence[endPointer]
        } else {
            if endPointer == startPointer {
                return sequence[endPointer]
            } else {
                return sum - sequence[startPointer-1]
            }
        }
    }
    while startPointer < sequence.count && endPointer < sequence.count && startPointer <= endPointer {
        if sum == k {
            if result.isEmpty {
                result.append(contentsOf: [startPointer, endPointer])
            } else {
                result = (result[1]-result[0] > endPointer-startPointer) ? [startPointer, endPointer] : result
            }
            endPointer += 1
            sum = calcSum(calc: .plus)
        } else if sum < k {
            endPointer += 1
            sum = calcSum(calc: .plus)
        } else {
            startPointer += 1
            sum = calcSum(calc: .minus)
        }
        
    }
    
    
    return result
}
