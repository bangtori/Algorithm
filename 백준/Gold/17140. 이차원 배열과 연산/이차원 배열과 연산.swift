let n = readLine()!.split(separator: " ").map{Int(String($0))!}
let (r, c, k) = (n[0], n[1] ,n[2])
var A: [[Int]] = []
for _ in 1...3 {
    A.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

func operation() -> Int {
    var timer = 0
    while timer <= 100 {
        // 배열의 크기가 원하는 r, c값보다 작아질 경우 index out 방지
        if r-1 < A.count && c-1 < A[0].count {
            if A[r-1][c-1] == k { return timer }
        }
        // 행의 개수가 같거나 더 많을 경우 R 연산 실행
        if A[0].count <= A.count {
            rOperation()
        }
        // 열의 개수가 더 클경우 C 연산 실행
        else {
            cOperation()
        }
        timer += 1
    }
    return -1
}

// R 연산
func rOperation() {
    var maxLength = 0
    for i in 0..<A.count {
        var dic: [Int:Int] = [:] // 개수 count 딕셔너리
        for num in A[i] {
            if num == 0 { continue } // 0인 경우 개수를 세지 않는다
            dic[num] == nil ? (dic[num] = 1) : (dic[num] = dic[num]! + 1)
        }
        A[i] = []
        // 새로운 배열에 해당 조건으로 정렬한 딕셔너리를 돌며 수, 등장 횟수 순으로 넣어준다
        for (key, value) in dic.sorted(by: { $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value}) {
            if A[i].count >= 100 { break } // 100개 이상일 경우 중단
            A[i].append(contentsOf: [key, value])
        }
        maxLength = max(maxLength, A[i].count)
    }
    // 빈 공간을 0으로 채워주기
    for i in 0..<A.count {
        A[i].append(contentsOf: Array(repeating: 0, count: maxLength - A[i].count))
    }
}
// C 연산
func cOperation() {
    var maxLength = 0
    var tempArr: [[Int]] = Array(repeating: [], count: A[0].count)
    
    for i in 0..<A[0].count {
        var dic: [Int:Int] = [:]
        for j in 0..<A.count {
            if A[j][i] == 0 { continue }
            dic[A[j][i]] == nil ? (dic[A[j][i]] = 1) : (dic[A[j][i]]! = dic[A[j][i]]! + 1)
        }
        // tempArr에 R 연산과 유사하게 하나의 열을 계산한 후, 행 형태로 넣어준다
        for (key, value) in dic.sorted(by: { $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value}) {
            tempArr[i].append(contentsOf: [key, value])
        }
        maxLength = max(maxLength, tempArr[i].count)
    }
    for i in 0..<tempArr.count {
        tempArr[i].append(contentsOf: Array(repeating: 0, count: maxLength - tempArr[i].count))
    }
    
    // 행 -> 열 회전
    A = Array(repeating: [], count: tempArr[0].count)
    for i in 0..<tempArr.count {
        for j in 0..<tempArr[0].count {
            A[j].append(tempArr[i][j])
        }
    }
}
print(operation())