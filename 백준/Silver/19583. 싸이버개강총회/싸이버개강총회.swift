import Foundation

let input = readLine()!.split(separator : " ").map{String($0)}

let S = input[0], E = input[1], Q = input[2]

let Stime = Int(S.split(separator: ":")[0])!*60 + Int(S.split(separator: ":")[1])!
let Etime = Int(E.split(separator: ":")[0])!*60 + Int(E.split(separator: ":")[1])!
let Qtime = Int(Q.split(separator: ":")[0])!*60 + Int(Q.split(separator: ":")[1])!

var user = [String:Int]()
var total = 0

while true  {
    var input2 : String? = nil
    input2 = readLine()
    if input2 == nil || input2! == "" {
        break
    }
    let timeStr = input2!.split(separator : " ")[0]
    let name = String(input2!.split(separator : " ")[1])
    
    let time = Int(timeStr.split(separator: ":")[0])!*60 + Int(timeStr.split(separator: ":")[1])!
    
    if time <= Stime {
        if user[name] == nil {
            user[name] = 1
        }
    }else if time >= Etime && time <= Qtime {
        if let c = user[name] {
            if c == 1 {
                user[name]! += 1
                total += 1
            }
        }
    }
}

print(total)

