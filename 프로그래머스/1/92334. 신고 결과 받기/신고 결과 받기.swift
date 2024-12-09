import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportDict: [String: Set<String>] = [:] // value: key 아이디를 신고한 유저들
    var indexDict: [String: Int] = [:]
    for (index, id) in id_list.enumerated() {
        reportDict[id] = Set()
        indexDict[id] = index
    }
    for reportInfo in report {
        let reportArr = reportInfo.split(separator: " ").map{String($0)}
        reportDict[reportArr[1]]?.insert(reportArr[0])
    }
    // 정지되는 아이디만 필터링
    let filterDict = reportDict.filter { (_, value) in
        return value.count >= k
    }
    var result = [Int](repeating: 0, count: id_list.count)
   
    for (_, reportUsers) in filterDict {
        for reportUser in reportUsers {
            if let resultIndex = indexDict[reportUser], resultIndex < result.count {
                result[resultIndex] += 1
            }
        }
    }
    return result
}