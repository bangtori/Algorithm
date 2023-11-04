import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var count = 0
    var hambuger = [1,2,3,1]
    var a: [Int] = []
    for i in ingredient {
        a.append(i)
        if a.count >= 4 && (Array(a[a.count-4...a.count-1]) == hambuger){
            count += 1
            for _ in 1...4 {
                a.popLast()
            }
        }
    }
    return count
}