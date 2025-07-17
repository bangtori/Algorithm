let n = Int(readLine()!)!
var arr: [[String]] = []

for _ in 0..<n {
    arr.append(Array(readLine()!).map{String($0)})
}

func findHeartPosition() -> (Int, Int) {
    for i in 0..<n {
        for j in 0..<n {
            if arr[i][j] == "*" {
                return (i+1, j)
            }
        }
    }
    return (-1, -1)
}


let heartPosition = findHeartPosition()
var result = [0, 0, 0, 0, 0] // 왼쪽 팔, 오른쪽 팔, 허리, 왼쪽 다리, 오른쪽 다리

result[0] = arr[heartPosition.0][0..<heartPosition.1].filter{$0 == "*"}.count
result[1] = arr[heartPosition.0][(heartPosition.1+1)...].filter{$0 == "*"}.count
for i in (heartPosition.0+1)..<n {
    if arr[i][heartPosition.1] == "*" {
        result[2] += 1
    }
    if arr[i][heartPosition.1-1] == "*" {
        result[3] += 1
    }
    if arr[i][heartPosition.1+1] == "*" {
        result[4] += 1
    }
}
print("\(heartPosition.0+1) \(heartPosition.1+1)")
print(result.map{String($0)}.joined(separator: " "))