let n = Int(readLine()!)!
func isHandsu(_ num: Int) -> Bool {
    if num < 10 { return true } // 한자리수는 무조건 한수
    let numArr = Array(String(num)).compactMap { Int(String($0)) }
    let diff =  numArr[1] - numArr[0]
    
    for i in 1..<numArr.count {
        if numArr[i] - numArr[i-1] != diff {
            return false
        }
    }
    return true
}

var count = 0
for i in 1...n {
    if isHandsu(i) {
        count += 1
    }
}

print(count)