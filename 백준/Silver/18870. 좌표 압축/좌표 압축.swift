let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
let sortedArr = arr.enumerated().map{(index: $0, value: $1)}.sorted { $0.value < $1.value }

var result = [Int](repeating: 0, count: n)

var prevCount = 0
for i in 1..<n {
    if sortedArr[i].value == sortedArr[i-1].value {
        result[sortedArr[i].index] = result[sortedArr[i-1].index]
    } else {
        prevCount += 1
        result[sortedArr[i].index] = prevCount
    }
}

print(result.map{String($0)}.joined(separator: " "))