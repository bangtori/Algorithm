let n = Int(readLine()!)!
var infos = [[Int]]()
for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    infos.append(info)
}

var result = [Int]()

for i in 0..<n {
    var count = 0
    for j in 0..<n {
        if i == j { continue }
        if infos[i][0] < infos[j][0] && infos[i][1] < infos[j][1] {
            count += 1
        }
    }
    result.append(count + 1)
}

print(result.map{String($0)}.joined(separator: " "))