import Foundation

func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    var limitTime: [Int: Int] = [:]
    var sum = 0
    var currentServer = 1
    for time in 0..<players.count {
        let player = players[time]
        let capacity = currentServer * m - 1
        if capacity < player {
            let needServer = (player - capacity) % m == 0 ? (player - capacity) / m : (player - capacity) / m + 1
            limitTime[time+k] = needServer
            sum += needServer
            currentServer += needServer
        }
        if let finishServer = limitTime[time+1] {
            currentServer -= finishServer
            limitTime[time+1] = nil
        }
    }
    return sum
}