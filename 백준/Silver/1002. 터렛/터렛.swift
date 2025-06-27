import Foundation
let t = Int(readLine()!)!
for _ in 1...t {
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    
    // 두 좌표사이 거리
    let dx = Double(info[0] - info[3])
    let dy = Double(info[1] - info[4])
    let d = (dx * dx + dy * dy).squareRoot()
    
    // 각각 좌표를 중심으로 한 원의 반지름
    let r1 = Double(info[2])
    let r2 = Double(info[5])
    // 교점 무한대
    if d == 0 && r1 == r2 {
        print(-1)
    } else if abs(r2-r1) < d && d < r2+r1 {
        // 교점 두개
        print(2)
    } else if d == r1 + r2 || abs(r2-r1) == d {
        // 교점이 한개
        print(1)
    } else {
        print(0)
    }
    
}
