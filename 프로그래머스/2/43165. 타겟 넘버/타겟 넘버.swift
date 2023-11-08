import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
        var count = 0
    func dfs(nums: [Int]) {
        var result = 0
        if nums.count == numbers.count {
            if nums.reduce(0, { $0 + $1 }) == target {
                count += 1
            }
        } else {
            dfs(nums: nums+[numbers[nums.count]])
            dfs(nums: nums+[-numbers[nums.count]])
        }
    }
    dfs(nums: [numbers[0]])
    dfs(nums: [-numbers[0]])
    return count
}