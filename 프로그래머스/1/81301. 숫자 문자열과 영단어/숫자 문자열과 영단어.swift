import Foundation

func solution(_ s:String) -> Int {
    let wordDic: [String: String] = ["zero":"0", "one":"1", "two":"2", "three":"3", "four":"4", "five":"5", "six":"6", "seven":"7", "eight":"8", "nine":"9"]
    var s = s
    for (word, number) in wordDic {
        s = s.replacingOccurrences(of: word, with: String(number))
    }
    return Int(s)!
}