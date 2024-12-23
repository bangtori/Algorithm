import Foundation

let n = Int(readLine()!)!
let input = readLine()!
var dic = [Character: Int]()
let asciiA = 65
for i in 0..<n {
    let currentChar = asciiA + i
    let char = Character(UnicodeScalar(currentChar)!)
    let value = Int(readLine()!)!
    dic[char] = value
}

var stack = [Double]()
var count: Double = 0.0
for char in input {
    if let num = dic[char] {
        stack.append(Double(num))
    } else {
        if stack.count < 2 { continue }
        let num1 = Double(stack.removeLast())
        let num2 = Double(stack.removeLast())
        var result: Double?
        switch char {
        case "+" :
            result = num2 + num1
        case "-":
            result = num2 - num1
        case "*":
            result = num2 * num1
        case "/":
            result = num2 / num1
        default:
            continue
        }
        if let result = result {
            stack.append(result)
        }
    }
}

print(String(format: "%.2f", stack.last!))
