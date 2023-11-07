import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let dic = [6:1, 5:2, 4:3, 3:4, 2:5]
    let zeroCount = lottos.filter{ $0 == 0 }.count
    let intersection = Set(win_nums).intersection(Set(lottos))
    let max = intersection.count + zeroCount < 2 ? 6 : dic[intersection.count + zeroCount]
    let min = intersection.count < 2 ? 6 : dic[intersection.count]
    return [max!, min!]
}