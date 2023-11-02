import Foundation

func solution(_ n:Int) -> Int {
    var i = 1
    while(true) {
        if (6 * i) % n == 0 { return i }
        i += 1
    }
}