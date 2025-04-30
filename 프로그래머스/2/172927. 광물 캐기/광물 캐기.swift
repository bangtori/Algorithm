import Foundation

enum Minerals: Int {
    case dia = 25
    case iron = 5
    case stone = 1
    
    func getCondition(_ tool: Minerals) -> Int {
        return self.rawValue / tool.rawValue < 1 ? 1 : self.rawValue / tool.rawValue
    }
    
    init(name: String) {
        switch name {
        case "diamond":
            self = .dia
        case "iron":
            self = .iron
        default:
            self = .stone
        }
    }
    
    init(pick: Int) {
        switch pick {
        case 0:
            self = .dia
        case 1:
            self = .iron
        default:
            self = .stone
        }
    }
}
func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    let maxLength = picks.reduce(0) { $0 + $1 } * 5
    let mineralList: [Minerals] = minerals.prefix(maxLength).map { Minerals(name: $0) }
    let splitArr = stride(from: 0, to: mineralList.count, by: 5).map {
        Array(mineralList[$0..<min($0 + 5, mineralList.count)])
    }.sorted { list1, list2 in
        let sum1 = list1.reduce(0) { $0 + $1.rawValue }
        let sum2 = list2.reduce(0) { $0 + $1.rawValue }
        return sum1 > sum2
    }

    var tools = [Minerals]()
    for i in 0..<picks.count {
        tools.append(contentsOf: Array(repeating: Minerals(pick: i), count: picks[i]))
    }
    var result = 0
    for turn in splitArr {
        if tools.isEmpty { break }
        let currentTool = tools.removeFirst()
        for mineral in turn {
            result += mineral.getCondition(currentTool)
        }
    }
    
    return result
}