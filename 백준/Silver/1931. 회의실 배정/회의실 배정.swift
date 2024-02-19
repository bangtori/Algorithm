let n = Int(readLine()!)!
var meetingTime = [(Int, Int)]()
for _ in 1...n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    meetingTime.append((input[0], input[1]))
}
meetingTime.sort {
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    }
    return $0.1 < $1.1
}

var count = 1
var endTime = meetingTime[0].1
for i in 1..<meetingTime.count {
    if meetingTime[i].0 >= endTime {
        endTime = meetingTime[i].1
        count += 1
    }
}
print(count)