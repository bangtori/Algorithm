import Foundation

func getTimeInterval(_ start: String, _ end: String) -> Int {
    let format = DateFormatter()
    format.dateFormat = "HH:mm"
    let startTime = format.date(from: start)!
    let endTime = format.date(from: end)!
    
    return Int(endTime.timeIntervalSince(startTime)) / 60
}
func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var dic = [String: String]()
    var cumulativeTimes = [String: Int]()
    //fees : 기본 시간, 기본 요금, 단위 시간, 단위 요금
    for record in records {
        let input = record.components(separatedBy: " ")
        let (time, number, state) = (input[0], input[1], input[2])
        if state == "IN" {
            dic[number] = time
        } else {
            let inTime = dic[number]!
            if let _ = cumulativeTimes[number] {
                cumulativeTimes[number]! += getTimeInterval(inTime, time)
            } else {
                cumulativeTimes[number] = getTimeInterval(inTime, time)
            }
            dic[number] = nil
        }
    }
    if !dic.isEmpty {
        for (carNumber, inTime) in dic {
            if let _ = cumulativeTimes[carNumber] {
                cumulativeTimes[carNumber]! += getTimeInterval(inTime, "23:59")
            } else {
                cumulativeTimes[carNumber] = getTimeInterval(inTime, "23:59")
            }
        }
    }
    var result = [Int]()
    for (carNumber, cumulativeTime) in cumulativeTimes.sorted{$0.key < $1.key} {
        if cumulativeTime <= fees[0] {
            result.append(fees[1])
        } else {
            let add = Int(ceil(Double((cumulativeTime-fees[0])) / Double(fees[2]))) * fees[3]
            result.append(fees[1] + add)
        }
    }
    return result
}