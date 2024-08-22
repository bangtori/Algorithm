import Foundation

let k = Int(readLine()!)!
let n = Int(readLine()!)!

var start = Array(65..<65+k) // 'A'의 ASCII 값부터 시작
var finish = Array(readLine()!).map { Int($0.asciiValue!) }
var graph = [[Character]](repeating: [Character](repeating: " ", count: k-1), count: n)
var result = [Character]()
var fault = 0

// 사다리 입력 받기
for i in 0..<n {
    let line = Array(readLine()!)
    for j in 0..<k-1 {
        graph[i][j] = line[j]
        if graph[i][j] == "?" {
            fault = i
        }
    }
}

// start 배열을 ?가 만나기전 까지 진행
for i in 0..<fault {
    for j in 0..<k-1 {
        if graph[i][j] == "-" {
            start.swapAt(j, j+1)
        }
    }
}

// finish 배열을 ?가 만나기전 까지 진행
for i in (fault+1..<n).reversed() {
    for j in 0..<k-1 {
        if graph[i][j] == "-" {
            finish.swapAt(j, j+1)
        }
    }
}

// 결과 도출
for i in 0..<k-1 {
    if start[i] == finish[i] {
        result.append("*")
    } else if start[i] == finish[i+1] && start[i+1] == finish[i] {
        start.swapAt(i, i+1)
        result.append("-")
    } else {
        result = [Character](repeating: "x", count: k-1)
        break
    }
}

// 결과 출력
print(String(result))