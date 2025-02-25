import Foundation

func solution(_ expression:String) -> Int64 {
    func getOperatorPriority(operators: [String]) -> [[String]] {
        var result = [[String]]()
        
        func getPriority(_ current: [String]) {
            if current.count == operators.count {
                result.append(current)
                return
            }
            
            for op in operators {
                if !current.contains(op) {
                    getPriority(current+[op])
                }
            }
        }
        getPriority([])
        return result
    }
    // 연산자 분리
    let arr = Array(expression)
    var operators: Set<String> = []
    var splitResult: [String] = []
    var preNum = ""
    for i in 0..<arr.count {
        let c = arr[i]
        if c.isNumber {
            preNum += String(c)
        } else {
            // 연산자 일 경우
            splitResult.append(preNum)
            splitResult.append(String(c))
            operators.insert(String(c))
            preNum = ""
        }
    }
    if !preNum.isEmpty {
        splitResult.append(preNum)
    }
    
    let priority = getOperatorPriority(operators: Array(operators))
    func getPrizes(_ priority: [String]) -> Int64 {
        var expression = splitResult
        for op in priority {
            while let idx = expression.firstIndex(of: op) {
                let left = Int64(expression[idx-1])!
                let right = Int64(expression[idx+1])!
                let result: Int64
                switch op {
                case "+":
                    result = left + right
                case "-":
                    result = left - right
                case "*":
                    result = left * right
                default:
                   result = 0
                }
                expression = (idx-1 > 0 ? Array(expression[0..<(idx-1)]) : []) +
                             [String(result)] +
                             (idx+2 < expression.count ? Array(expression.suffix(from: idx+2)) : [])
            }
        }

        return abs(Int64(expression[0])!)
    }
    var maxValue: Int64 = 0
    for ops in priority {
        maxValue = max(maxValue, getPrizes(ops))
    }
    return maxValue
}