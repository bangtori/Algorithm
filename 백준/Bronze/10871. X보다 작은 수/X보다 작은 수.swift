let input = readLine()!.split(separator: " ").map{ Int($0)!}
let (n, x) = (input[0], input[1])
print(readLine()!.split(separator: " ").map{Int($0)!}.filter{$0 < x}.map{String($0)}.joined(separator: " "))