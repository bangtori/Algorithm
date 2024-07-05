let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])
let kArr = readLine()!.split(separator: " ").map { Int($0)! }
func dfs(currentNumber: String, digits: [String], maxNumber: Int) -> Int {
    // 현재까지 만든 숫자가 maxNumber를 넘으면 중단
    if Int(currentNumber)! > maxNumber {
        return 0
    }
    
    var maxResult = Int(currentNumber)!
    
    for digit in digits {
        let newNumber = currentNumber + digit
        let result = dfs(currentNumber: newNumber, digits: digits, maxNumber: maxNumber)
        maxResult = max(maxResult, result)
    }
    
    return maxResult
}

func findLargestNumber(N: Int, K: [Int]) -> Int {
    let digits = K.map { String($0) }
    let maxNumber = N
    var maxResult = 0
    

    for digit in digits {
        maxResult = max(maxResult, dfs(currentNumber: digit, digits: digits, maxNumber: maxNumber))
    }
    
    return maxResult
}


print(findLargestNumber(N: n, K: kArr))