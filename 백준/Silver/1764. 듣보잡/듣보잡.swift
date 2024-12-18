let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input[0], input[1])

var 듣도못한사람들 = Set<String>()
var 보도못한사람들 = Set<String>()

for _ in 0..<n {
    let name = readLine()!
    듣도못한사람들.insert(name)
}
for _ in 0..<m {
    let name = readLine()!
    보도못한사람들.insert(name)
}

let 듣도보도못한사람들 = 듣도못한사람들.intersection(보도못한사람들)
print(듣도보도못한사람들.count)
듣도보도못한사람들.sorted().forEach { print($0) }