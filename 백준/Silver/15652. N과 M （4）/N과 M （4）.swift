let input = readLine()!.split(separator: " ").map{Int($0)!}, (n, m) = (input[0], input[1])

func pick(current: [Int], currentIndex: Int) {
    if current.count == m {
        print(current.map{String($0)}.joined(separator: " "))
        return
    }

    for i in currentIndex...n {
        pick(current: current + [i], currentIndex: i)
    }
}

pick(current: [], currentIndex: 1)