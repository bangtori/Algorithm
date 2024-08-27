import Foundation
let n = Int(readLine()!)!
let start = Array(readLine()!).map { $0 == "1" }
let target = Array(readLine()!).map { $0 == "1" }

func toggle(_ arr: inout [Bool], _ index: Int) {
    for i in index-1...index+1 {
        if i >= 0 && i < arr.count {
            arr[i].toggle()
        }
    }
}

func solve(_ n: Int, _ start: [Bool], _ target: [Bool]) -> Int {
    var count = 0
    var arr = start

    for i in 1..<n {
        if arr[i - 1] != target[i - 1] {
            toggle(&arr, i)
            count += 1
        }
    }

    return arr == target ? count : Int.max
}


let result1 = solve(n, start, target)
var start2 = start
toggle(&start2, 0)
var result2 = solve(n, start2, target)
result2 = result2 == Int.max ? result2 : result2 + 1

let result = min(result1, result2)

print(result == Int.max ? -1 : result)