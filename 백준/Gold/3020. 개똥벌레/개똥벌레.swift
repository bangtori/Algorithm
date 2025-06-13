let info = readLine()!.split(separator: " ").map{Int($0)!}
let (n, h) = (info[0], info[1])

var arr = Array(repeating: 0, count: h+1) // 위를 기준으로 시작

// 경계 체크
for i in 1...n {
    let length = Int(readLine()!)!
    if i % 2 == 1 {
        // 석순 (역방향)
        arr[h] -= 1
        arr[h-length] += 1
    } else {
        // 종유석 (정방향)
        arr[0] += 1
        arr[length] -= 1
    }
}

// 누적합 구하기
for i in 1...h {
    arr[i] += arr[i-1]
}
arr.removeLast()

let minValue = arr.min() ?? 0
print("\(minValue) \(arr.filter{$0 == minValue}.count)")