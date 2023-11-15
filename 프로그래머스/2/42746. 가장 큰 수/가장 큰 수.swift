import Foundation

func solution(_ numbers:[Int]) -> String {
    var stringNumbers = numbers.map{String($0)}
    stringNumbers.sort{
        return $0+$1 > $1+$0
    }
    if stringNumbers[0] == "0" { return "0" }
    return stringNumbers.joined(separator: "")
}