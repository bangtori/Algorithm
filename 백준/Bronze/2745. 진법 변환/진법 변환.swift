import Foundation
let input = readLine()!.split(separator: " ").map{String($0)}
let (n, b) = (input[0], Double(input[1])!)
var dic: [Character: Int] = Dictionary()
let str = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
str.enumerated().map { (i, num) in
    dic[num] = i
}
var result = 0
for (i, c) in n.reversed().enumerated() {
    result += dic[c]! * Int(pow(b, Double(i)))
}
print(result)