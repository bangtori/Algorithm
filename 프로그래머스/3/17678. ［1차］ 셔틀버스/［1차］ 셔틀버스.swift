struct Time: Comparable, Hashable {
    let hour:Int
    let minute:Int
    
    var timeString: String {
        return self.description
    }
    
    
    var beforeOneMinute: Time {
        var newHour = hour
        var newMinute = minute - 1
        
        if newMinute < 0 {
            newMinute = 59
            newHour -= 1
        }
        
        return Time(str: String(format: "%02d:%02d", newHour, newMinute))
    }
    
    init(str: String) {
        let time = str.split(separator: ":")
        self.hour = Int(time[0])!
        self.minute = Int(time[1])!
    }
    
    static func < (lhs: Time, rhs: Time) -> Bool {
        if lhs.hour == rhs.hour {
            return lhs.minute < rhs.minute
        }
        
        return lhs.hour < rhs.hour
    }
    
    static func == (lhs: Time, rhs: Time) -> Bool {
        return lhs.hour == rhs.hour && lhs.minute == rhs.minute
    }
    
    static func + (lhs: Time, rhs: Time) -> Time {
        var hour = lhs.hour + rhs.hour
        var minute = lhs.minute + rhs.minute
        
        while minute >= 60 {
            minute -= 60
            hour += 1
        }
        
        return Time(str: "\(hour):\(minute)")
    }
    
}
extension Time: CustomStringConvertible {
    var description: String {
        return String(format: "%02d:%02d", hour, minute)
    }
}
func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    let startTime = Time(str: "09:00")
    var timeInterval: [Time] = [startTime]
    for _ in 1..<n {
        let nextTime = timeInterval.last! + Time(str: String(format: "%02d:%02d", 0, t))
        timeInterval.append(nextTime)
    }

    if timetable.count < m {
        return timeInterval.last?.description ?? "09:00"
    }
    
    var sortedTimetable = timetable.map{Time(str: $0)}.sorted(by: >)
    
    for i in 0..<timeInterval.count {
        var currentPerson = 0
        var lastPersonTime: Time?
        while currentPerson < m && !sortedTimetable.isEmpty {
            if sortedTimetable.last! <= timeInterval[i] {
                lastPersonTime = sortedTimetable.removeLast()
                currentPerson += 1
            } else {
                break
            }
        }
        if i == timeInterval.count - 1 {
            if currentPerson < m {
                break
            }
            if let lastPersonTime = lastPersonTime {
                return min(lastPersonTime.beforeOneMinute, timeInterval[i]).description
            } else {
                break
            }
        }
    }
    
    return timeInterval.last!.description
}