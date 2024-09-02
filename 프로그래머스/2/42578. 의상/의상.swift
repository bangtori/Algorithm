import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dic = [String: Int]()
    
    // 의상 종류별로 개수 세기
    for info in clothes {
        dic[info[1], default: 0] += 1
    }
    
    // 모든 종류의 의상을 착용하지 않는 경우는 제외하고 계산
    let result = dic.values.reduce(1) { $0 * ($1 + 1) } - 1
    
    return result
}