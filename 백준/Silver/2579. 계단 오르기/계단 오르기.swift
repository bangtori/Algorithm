let n = Int(readLine()!)!
var floorScore = [Int]()
for _ in 1...n {
    floorScore.append(Int(readLine()!)!)
}
var oneStepDp = [Int](repeating: 0, count: n+1)
var twoStepDp = [Int](repeating: 0, count: n+1)
oneStepDp[0] = 0
twoStepDp[0] = 0
oneStepDp[1] = floorScore[0]
twoStepDp[1] = 0

if n >= 2 {
    for i in 2...n {
        if i == 2 {
            oneStepDp[i] = max(oneStepDp[i-1], twoStepDp[i-1]) + floorScore[i-1]
        } else {
            oneStepDp[i] = twoStepDp[i-1] + floorScore[i-1]
        }
        twoStepDp[i] = max(oneStepDp[i-2], twoStepDp[i-2]) + floorScore[i-1]
    }
}

print(max(oneStepDp[n], twoStepDp[n]))