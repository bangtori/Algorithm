let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input[0], input[1])
var result1: [[Int]] = []
var result2: [[Int]] = []
for _ in 1...n {
    result1.append(readLine()!.split(separator: " ").map{Int($0)!})
}

for _ in 1...n {
    result2.append(readLine()!.split(separator: " ").map{Int($0)!})
}

let result = zip(result1, result2).map{zip($0,$1).map{$0+$1}}

for i in result {
    print(i.map{String($0)}.joined(separator: " "))
}