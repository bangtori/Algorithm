import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var a = A.sorted()
    var b = B.sorted()
    
    var ans = 0
    for _ in 1...a.count {
        if (a.first! * b.last!) > (a.last! * b.first!) {
            ans += (a.last! * b.first!)
            a.removeLast()
            b.removeFirst()
        } else {
            ans += (a.first! * b.last!)
            a.removeFirst()
            b.removeLast()
        }
    }
    return ans
}
