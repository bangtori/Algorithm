import Foundation

func solution(_ lines:[String]) -> Int {
    var times: [(startTime:Double, endTime:Double)] = []
    for line in lines {
        let traffic = line.split(separator: " ").map{String($0)}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        let endTime = dateFormatter.date(from: "\(traffic[0]) \(traffic[1])")!.timeIntervalSince1970
        let t = Double(traffic[2].prefix(traffic[2].count - 1))!
        times.append((endTime-t+0.001,endTime))
    }
    
    var maxCount = 0
    for i in 0..<times.count {
        var count = 1
        for j in i+1..<times.count {
            let time1 = times[i]
            let time2 = times[j]
            if time2.startTime >= time1.endTime && time2.startTime <= time1.endTime + 0.999 || time2.endTime >= time1.endTime && time2.endTime <= time1.endTime + 0.999 || time2.startTime <= time1.endTime && time2.endTime >= time1.endTime + 0.999{
                count += 1
            }
        }
        if maxCount < count {
            maxCount = count
        }
    }
    return maxCount
}