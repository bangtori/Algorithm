let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, k) = (input[0], input[1])
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var start = 0
var end = 0
var oddCount = 0

var maxValue = 0
while start < n {
    // end를 증가시키면서 홀수의 개수를 확인
    while end < n && oddCount + (arr[end] % 2 != 0 ? 1 : 0) <= k {
        if arr[end] % 2 != 0 {
            oddCount += 1
        }
        end += 1
    }
    // 최대값 갱신 (end는 마지막 유효 범위보다 1 크므로 end-1 사용)
    maxValue = max(maxValue, end - start - oddCount)
    
    // start를 증가시키면서 홀수의 개수를 줄임
    if arr[start] % 2 != 0 {
        oddCount -= 1
    }
    start += 1
}

print(maxValue)