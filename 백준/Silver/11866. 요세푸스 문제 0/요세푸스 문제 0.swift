let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input[0], input[1])

var queue = Array(1...n)
var index = 0

var result = [Int]()
while index < queue.count {
    for i in 1...m {
        let element = queue[index]
        if i != m {
            queue.append(element)
        } else {
            result.append(element)
        }
        index += 1
    }
}

print("<\(result.map{String($0)}.joined(separator: ", "))>")