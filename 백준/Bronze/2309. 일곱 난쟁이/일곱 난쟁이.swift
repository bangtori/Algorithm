func combi(_ nums: [Int], _ targetNum: Int) -> [[Int]] {
    var result = [[Int]]()
    
    func combination(_ index: Int, _ nowCombi: [Int]) {
        if nowCombi.count == targetNum {
            result.append(nowCombi)
            return
        }
        for i in index..<nums.count {
            combination(i + 1, nowCombi + [nums[i]])
        }
    }
    
    combination(0, [])
    
    return result
}
var nine = [Int]()
for _ in 1...9 {
    nine.append(Int(readLine()!)!)
}
for nums in combi(nine, 7) {
    var sorted = nums.sorted()
    if sorted.reduce(0, {$0 + $1}) == 100 {
        sorted.map{ print ($0) }
        break
    }
}
