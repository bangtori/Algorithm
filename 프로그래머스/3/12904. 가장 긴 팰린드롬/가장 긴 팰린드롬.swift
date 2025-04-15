import Foundation

func solution(_ s:String) -> Int {
    var result = 1
    let str = Array(s)
    func findPalindrome(left: Int, right: Int) {
        var l = left
        var r = right
        while l >= 0 && r < str.count && str[l] == str[r] {
            result = max(result, r - l + 1)
            l -= 1
            r += 1
        }
    }
    
    for i in 0..<str.count {
        // 홀수 길이 중심
        findPalindrome(left: i, right: i)
        // 짝수 길이 중심 
        findPalindrome(left: i, right: i + 1)
    }
    
    return result
}