let n = Int(readLine()!)!
let cards = Set(readLine()!.split(separator: " ").map{Int($0)!})
let m = Int(readLine()!)!
let targets = readLine()!.split(separator: " ").map{Int($0)!}

var result = [String]()
for target in targets {
    if cards.contains(target) {
        result.append("1")
    } else {
        result.append("0")
    }
}

print(result.joined(separator: " "))