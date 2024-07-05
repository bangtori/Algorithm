let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])
let kArr = readLine()!.split(separator: " ").map { String($0) }

// currentNumber: 현재까지 만든 숫자
func dfs(currentNumber: String) -> Int {
    if Int(currentNumber)! > n {
        return 0
    }
    
    var maxResult = Int(currentNumber)!
    
    for digit in kArr {
        let newNumber = currentNumber + digit
        let result = dfs(currentNumber: newNumber)
        maxResult = max(maxResult, result)
    }
    
    return maxResult
}


var maxResult = 0


for digit in kArr {
    maxResult = max(maxResult, dfs(currentNumber: digit))
}


print(maxResult)