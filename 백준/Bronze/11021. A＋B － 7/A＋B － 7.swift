let t:Int = Int(readLine()!)!
for i in 1...t {
    let nums = readLine()!.split(separator: " ").map {Int($0)!}
    print("Case #\(i): \(nums[0] + nums[1])")
}