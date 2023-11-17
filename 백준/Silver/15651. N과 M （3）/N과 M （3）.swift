let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input[0], input[1])

func back(result: String, count: Int) {
    if count == m {
        print(result)
        return
    }

    for i in 1...n {
        back(result: "\(result) \(i)", count: count + 1)
    }
}
for i in 1...n {
    back(result: "\(i)", count: 1)
}