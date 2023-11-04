let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{Int($0)!}
print("\(nums.min()!) \(nums.max()!)")