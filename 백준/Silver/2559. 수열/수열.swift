let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, k) = (input[0], input[1])
var arr = Array(readLine()!.split(separator: " ").map{Int($0)!})

var sums = [Int]()
sums.append(arr[0..<k].reduce(0, { $0 + $1 }))
for i in k..<arr.count {
    let preSum = sums.last!
    let sum = preSum + arr[i] - arr[i-k]
    sums.append(sum)
}

print(sums.max()!)