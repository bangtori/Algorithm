let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ")
let v = readLine()!
nums.removeAll { $0 == v }
print(n - nums.count)