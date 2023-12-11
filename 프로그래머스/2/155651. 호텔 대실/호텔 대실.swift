import Foundation

func solution(_ book_time:[[String]]) -> Int {
    let book_time = book_time.sorted(by: {$0[0] < $1[0]})
    var times = [[Int]]()
    var rooms = [[Int]]()
    for time in book_time {
        let start = time[0].split(separator: ":").map{Int($0)!}
        let end = time[1].split(separator: ":").map{Int($0)!}
        times.append([start[0]*60 + start[1], end[0]*60 + end[1]])
    }

    for time in times {
        var flag = false
        for i in 0..<rooms.count {
            if rooms[i][1] + 10 <= time[0] {
                rooms[i] = time
                flag = true
                break
            }
        }
        if !flag {
            rooms.append(time)
        }
    }
    return rooms.count
}