import Foundation

func solution(_ n:Int) -> Int
{
    let nOneCount = String(n, radix: 2).filter{$0 == "1"}.count
    var answer:Int = n + 1
    while true {
        if String(answer, radix: 2).filter{$0 == "1"}.count == nOneCount {
            break
        }
        answer += 1
    }
    return answer
}