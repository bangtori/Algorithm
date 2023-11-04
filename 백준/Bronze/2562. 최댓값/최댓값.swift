var nums: [(Int,Int)] = []
for i in 1...9 {
    nums.append((i,Int(readLine()!)!))
}
nums.sort{ $0.1 < $1.1 }
print(nums.last!.1)
print(nums.last!.0)