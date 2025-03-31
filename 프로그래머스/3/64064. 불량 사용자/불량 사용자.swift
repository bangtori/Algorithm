import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var result = [[Int]]()
    
    for id in banned_id {
        var sanctionIds = [Int]()
        for i in 0..<user_id.count {
            let user = user_id[i]
            if user.count != id.count { continue }
            if zip(id, user).allSatisfy({ (banned, user) in
                banned == "*" || banned == user
            }) {
                sanctionIds.append(i)
            }
        }
        result.append(sanctionIds)
    }
    
    var resultSet = Set<Set<Int>>()  // 중복 제거를 위한 Set<Set<Int>>
    
    func dfs(_ depth: Int, _ path: [Int]) {
        if depth == result.count {
            resultSet.insert(Set(path))  // 순서 상관없는 조합 저장
            return
        }
        
        for id in result[depth] {
            if !path.contains(id) {
                dfs(depth + 1, path + [id])
            }
        }
    }
    
    dfs(0, [])

    return resultSet.count
}