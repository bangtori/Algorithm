let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }
let reverseArr = Array(arr.reversed())
var increaseDp = [Int](repeating: 1, count: n)
var decreaseDp = [Int](repeating: 1, count: n)

for i in 1..<n {
    for j in 0...i {
        if arr[i] > arr[j] {
            increaseDp[i] = max(increaseDp[i], increaseDp[j]+1)
        }
        if reverseArr[i] > reverseArr[j] {
            decreaseDp[i] = max(decreaseDp[i], decreaseDp[j]+1)
        }
    }
}

var resultDp = [Int](repeating: 0, count: n)
for i in 0..<n {
    resultDp[i] = increaseDp[i] + decreaseDp[n - i - 1] - 1
}

print(resultDp.max()!)