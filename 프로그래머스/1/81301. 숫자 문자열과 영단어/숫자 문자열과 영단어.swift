import Foundation

func solution(_ s:String) -> Int {
    let wordDic: [String: String] = ["zero":"0", "one":"1", "two":"2", "three":"3", "four":"4", "five":"5", "six":"6", "seven":"7", "eight":"8", "nine":"9"]
    var stringArr = Array(s)
    var resultString = ""
    var start = 0
    for i in 0..<stringArr.count {
        if stringArr[i].isNumber {
            start = i + 1
            resultString += String(stringArr[i])
        } else {
            let currentWord = stringArr[start...i].map{String($0)}.joined(separator: "")
            if wordDic[currentWord] != nil {
                resultString += wordDic[currentWord]!
                start = i + 1
            }
        }
    }
    return Int(resultString)!
}