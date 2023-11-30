func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var currentNum = 0
    var numbers = [Character]()
    while numbers.count < t * m {
        numbers += Array(String(currentNum, radix: n))
        currentNum += 1
    }

    var result = ""
    for i in 0..<t*m {
        let myRemain = p % m
        if (i+1) % m == myRemain {
            result += numbers[i].uppercased()
        }
    }
    return result
}