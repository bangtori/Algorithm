import Foundation

func solution(_ s:String) -> Bool
{
    var stack: [Character] = []
    for c in s {
        if c == "(" {
            stack.append(c)
        } else {
            if stack.isEmpty {
                return false
            } else {
                stack.popLast()
            }
        }
    }
    if stack.isEmpty {
        return true
    } else {
        return false
    }
}
