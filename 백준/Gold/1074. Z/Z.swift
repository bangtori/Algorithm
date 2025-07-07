import Foundation
typealias Position = (x:Int, y:Int)
let info = readLine()!.split(separator: " ").map{Int($0)!}
let (n, r, c) = (info[0], info[1], info[2])

var count = 0

func isTarget(start: Position, size: Int) -> Bool {
    if start.x..<start.x+size ~= c && start.y..<start.y+size ~= r {
        return true
    }
    return false
}

func zFind(start: Position, size: Int) {
    if size == 1 {
        if r == start.y && c == start.x {
            print(count)
            return
        }
        count += 1
    }
    
    let newSize = size / 2
    let zones = [(start.x, start.y),  (start.x + newSize, start.y), (start.x, start.y + newSize), (start.x + newSize, start.y + newSize)]
    for zone in zones {
        if isTarget(start: zone, size: newSize) {
            zFind(start: zone, size: newSize)
            break
        } else {
            count += (newSize * newSize)
        }
    }
}

zFind(start: (0,0), size: 2<<(n-1))