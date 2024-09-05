import Foundation
typealias PositionRange = (startX: Int, endX: Int, startY: Int, endY: Int)

func solution(_ arr:[[Int]]) -> [Int] {
    var result = [0, 0]
    func check(rect: PositionRange) -> Bool {
        let item = arr[rect.startY][rect.startX]
        for y in rect.startY...rect.endY {
            for x in rect.startX...rect.endX {
                if item != arr[y][x] { return false }
            }
        }
        return true
    }
    
    func recursion(rect: PositionRange) {
        if check(rect: rect) {
            if arr[rect.startY][rect.startX] == 0 { result[0] += 1 }
            else { result[1] += 1 }
            return
        } else {
            let n = (rect.endX - rect.startX + 1) / 2
            recursion(rect: (rect.startX, rect.startX+n-1, rect.startY, rect.startY+n-1))
            recursion(rect: (rect.startX+n, rect.endX, rect.startY, rect.startY+n-1))
            recursion(rect: (rect.startX, rect.startX+n-1, rect.startY+n, rect.endY))
            recursion(rect: (rect.startX+n, rect.endX, rect.startY+n, rect.endY))
        }
    }
    
    recursion(rect: (0, arr.count-1, 0, arr.count-1))
    
    return result
}