func recursion(_ s: [Character], _ l: Int, _ r: Int, _ count: Int) -> (Int, Int) {
    if l >= r {
        return (1, count)
    } else if s[l] != s[r] {
        return (0, count)
    } else {
        return recursion(s, l+1, r-1, count+1)
    }
}

func isPalindrome(_ s: [Character]) -> (Int, Int) {
    return recursion(s, 0, s.count-1, 1)
}

let t = Int(readLine()!)!
for _ in 1...t {
    let s: [Character] = Array(readLine()!)
    let result = isPalindrome(s)
    print("\(result.0) \(result.1)")
}
