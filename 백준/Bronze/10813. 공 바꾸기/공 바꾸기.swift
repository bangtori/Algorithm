let input = readLine()!.split(separator: " ").map{ Int($0)!}
let (n, m) = (input[0], input[1])
var arr = [Int](1...n)
for _ in 1...m {
    let nums = readLine()!.split(separator: " ").map{Int($0)!-1}
    arr.swapAt(nums[0], nums[1])
}
print(arr.map{String($0)}.joined(separator: " "))
