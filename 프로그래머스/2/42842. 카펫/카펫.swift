import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var result: [Int] = []
    for i in 1...Int(sqrt(Double(yellow)))+1 {
        if yellow % i == 0 {
            let w = max(yellow/i, i)
            let h = min(yellow/i, i)
            let brownCount = (w+2) * (h+2) - (w*h)
            if brown == brownCount {
                 result = [w+2, h+2]
            }
        }
    }
    return result
}