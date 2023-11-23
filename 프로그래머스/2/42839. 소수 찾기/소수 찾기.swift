import Foundation

func solution(_ numbers:String) -> Int {
    var result: [Int] = []
    func dfs(currentNum: String, currentIndex: Int, visit: [Bool], count: Int) {
        if count == numbers.count {
            return
        }
        var newVisit = visit
        newVisit[currentIndex] = true
        if isPrime(Int(currentNum)!) {
            result.append(Int(currentNum)!)
        }
        for (i,c) in numbers.enumerated() {
            if newVisit[i] == false {
                dfs(currentNum: "\(currentNum)\(c)" ,currentIndex: i, visit: newVisit, count: count + 1)
            }
        }
    }
    let visit = Array(repeating: false, count: numbers.count)
    for (i, number) in numbers.enumerated() {
        dfs(currentNum: "\(number)", currentIndex: i, visit: visit, count: 0)
    }
    return Set(result).count
}
func isPrime(_ n: Int) -> Bool {
    if n == 1 || n == 0 {
        return false
    } 
    if n == 2 {
        return true
    }
    for i in 2...Int(sqrt(Double(n))) + 1 {
        if n % i == 0 {
            return false
        }
    }
    return true
}