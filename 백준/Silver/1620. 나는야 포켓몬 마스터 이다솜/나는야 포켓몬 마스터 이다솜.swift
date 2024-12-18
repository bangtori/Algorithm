let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input[0], input[1])
var dicNumber = [Int: String]()
var dicName = [String: Int]()

for i in 1...n {
    let pokemon = readLine()!
    dicNumber[i] = pokemon
    dicName[pokemon] = i
}
for _ in 0..<m {
    let target = readLine()!
    if let number = Int(target) {
        print(dicNumber[number]!)
    } else {
        print(dicName[target]!)
    }
}
