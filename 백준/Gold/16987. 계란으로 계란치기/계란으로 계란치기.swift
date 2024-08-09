typealias Egg = (s:Int, w: Int)
let n = Int(readLine()!)!
var eggs: [Egg] = []

for _ in 1...n {
    let egg = readLine()!.split(separator: " ").map{Int($0)!}
    eggs.append((egg[0], egg[1]))
}

var maxValue = 0
func dfs(currentIndex: Int, count: Int) {
    if currentIndex == n { // 모든 계란을 다 집었을 경우
        maxValue = max(maxValue, count)
        return
    }
    if eggs[currentIndex].s <= 0 { // 손에 든 계란이 깨진 경우
        dfs(currentIndex: currentIndex + 1, count: count)
        return
    }
    
    var didHit = false
    for i in 0..<n {
        if i != currentIndex && eggs[i].s > 0 { // 손에 든 계란이 아니면서 깨지지 않은 계란일경우
            didHit = true
            eggs[currentIndex].s -= eggs[i].w
            eggs[i].s -= eggs[currentIndex].w
            
            dfs(currentIndex: currentIndex + 1, count: count + (eggs[currentIndex].s <= 0 ? 1 : 0) + (eggs[i].s <= 0 ? 1 : 0))
            
            // 원상복구
            eggs[currentIndex].s += eggs[i].w
            eggs[i].s += eggs[currentIndex].w
        }
    }
    
    
    if !didHit { // 더 이상 깰 수 있는 계란이 없는 경우
        dfs(currentIndex: currentIndex + 1, count: count)
    }
}

dfs(currentIndex: 0, count: 0)
print(maxValue)
