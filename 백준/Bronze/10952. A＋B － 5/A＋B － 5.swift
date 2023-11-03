while(true) {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    if nums[0] == 0, nums[1] == 0 {
        break
    }
    print(nums[0] + nums[1])
}