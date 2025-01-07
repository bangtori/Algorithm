let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input[0], input[1])
let numbers: [Int] = Array(readLine()!.split(separator: " ").map{Int($0)!})

var sumArr = [Int](repeating: 0, count: numbers.count+1)
sumArr[1] = numbers[1]

for i in 1...numbers.count {
    sumArr[i] = sumArr[i-1] + numbers[i-1]
}

for _ in 1...m {
    let interval = readLine()!.split(separator: " ").map{Int($0)!}
    print(sumArr[interval[1]]-sumArr[interval[0]-1])
}