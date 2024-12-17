import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a % b)
}

func gcdOfArray(_ nums: [Int]) -> Int {
    return nums.reduce(nums[0]) { gcd($0, $1) }
}

func divisors(_ n: Int) -> [Int] {
    var result = Set<Int>()
    let limit = Int(Double(n).squareRoot())
    
    for i in 1...limit {
        if n % i == 0 {
            result.insert(i)
            result.insert(n / i)
        }
    }
    return Array(result).sorted()
}



func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    let gcdA = gcdOfArray(arrayA)
    let gcdB = gcdOfArray(arrayB)
    
    func isValid(_ n: Int, _ array1: [Int], _ array2: [Int]) -> Bool {
        return array1.allSatisfy { $0 % n == 0 } && array2.allSatisfy { $0 % n != 0 }
    }
    
    let candidatesA = divisors(gcdA).filter { isValid($0, arrayA, arrayB) }
    let candidatesB = divisors(gcdB).filter { isValid($0, arrayB, arrayA) }
    
    return max(candidatesA.max() ?? 0, candidatesB.max() ?? 0)
}