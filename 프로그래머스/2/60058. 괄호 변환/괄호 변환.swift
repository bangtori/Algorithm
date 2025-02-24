import Foundation

func solution(_ p:String) -> String {
    func separateStr(_ str: String) -> (String, String) {
        let arr = Array(str)
        var u = ""
        var v = ""
        var rightCount = 0
        var leftCount = 0
        
        for i in 0..<str.count {
            if arr[i] == "(" {
                leftCount += 1
            } else {
                rightCount += 1
            }
            u += String(arr[i])
            
            if leftCount == rightCount {
                let remainLen = str.count - i - 1
                v = String(str.suffix(remainLen))
                break
            }
        }
        
        return (u, v)
    }
    func findRightStr(_ str: String) -> Bool {
        var stack = [Character]()
        for c in str {
            if c == "(" {
                stack.append("(")
            } else {
                if stack.isEmpty {
                    return false
                } else {
                    _ = stack.popLast()
                }
            }
        }
        return stack.isEmpty
    }
    
    func flipStr(_ str: String) -> String {
        var result = ""
        for c in str {
            if c == "(" {
                result += ")"
            } else {
                result += "("
            }
        }
        return result
    }
    
    func recursion(_ str: String) -> String {
        if str.isEmpty {
            return ""
        }
        if findRightStr(str) {
            return str
        }
        var (u, v) = separateStr(str)
        
        if findRightStr(u) {
            return u + recursion(v)
        } else {
            let blankStr = "(" + recursion(v) + ")"
            u.removeFirst()
            u.removeLast()
            return blankStr + flipStr(u)
        }
    }
    return recursion(p)
}