let num = Int(readLine()!)! // 게임하는 사람 수
let t = Int(readLine()!)! // 구할 T
let speak = Int(readLine()!)! // 구할 구호 -> 뻔은 0, 데기 1

//
var zeroArr = [Int]()
var oneArr = [Int]()

var current = 0 // 현재 사람
var currentN = 1
while zeroArr.count < t {
    var currentZero = [current%num, (current+2)%num]
    var currentOne = [(current+1)%num, (current+3)%num]
    let n = current + 4
    for i in 0..<currentN+1 {
        currentZero.append((n+i)%num)
        currentOne.append((n+currentN+1+i)%num)
    }
    zeroArr.append(contentsOf: currentZero)
    oneArr.append(contentsOf: currentOne)
    current = n + (2 * (currentN+1))
    currentN += 1
}

speak == 0 ? print(zeroArr[t-1]) : print(oneArr[t-1])