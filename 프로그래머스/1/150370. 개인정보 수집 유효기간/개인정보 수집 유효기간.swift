import Foundation

struct CustomDate: Comparable {
    let date: String
    var year: Int {
        return date.split(separator: ".").map{Int($0)!}[0]
    }
    
    var month: Int {
        return date.split(separator: ".").map{Int($0)!}[1]
    }
    
    var days: Int {
        return date.split(separator: ".").map{Int($0)!}[2]
    }
    
    static func < (lhs: CustomDate, rhs: CustomDate) -> Bool {
        if lhs.year != rhs.year {
            return lhs.year < rhs.year
        }
        if lhs.month != rhs.month {
            return lhs.month < rhs.month
        }
        return lhs.days < rhs.days
    }
    
    func getDeadLine(monthToAdd: Int) -> CustomDate {
        var year = self.year
        var month = self.month
        var days = self.days
        month += monthToAdd
        
        while month > 12 {
            year += 1
            month -= 12
        }
        
        // 하루전 날짜
        days -= 1
        if days == 0 {
            month -= 1
            if month == 0 {
                year -= 1
                month = 12
            }
            days = 28
        }
        
        return CustomDate(date: String(format: "%04d.%02d.%02d", year, month, days))
    }
}
func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let todayDate = CustomDate(date: today)
    var termsDic = [String: Int]()
    for term in terms {
        let splitArr = term.split(separator: " ").map{String($0)}
        termsDic[splitArr[0]] = Int(splitArr[1])
    }
    var result = [Int]()
    for i in 0..<privacies.count {
        let splitArr = privacies[i].split(separator: " ").map{String($0)}
        let date = CustomDate(date: splitArr[0])
        guard let deadLineMonth = termsDic[splitArr[1]] else { continue }
        let deadLine = date.getDeadLine(monthToAdd: deadLineMonth)
        
        if deadLine < todayDate {
            result.append(i+1)
        }
    }
    return result
}