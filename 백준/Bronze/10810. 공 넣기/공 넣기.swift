let input = readLine()!.split(separator: " ").map{ Int($0)!}
let (n, m) = (input[0], input[1])
var result = [Int](repeating: 0, count: n)
for _ in 1...m {
    let nums = readLine()!.split(separator: " ").map{Int($0)!}
    let (start, end, num) = (nums[0], nums[1], nums[2])
    for i in start...end {
        result[i-1] = num
    }
}

print(result.map{String($0)}.joined(separator: " "))
