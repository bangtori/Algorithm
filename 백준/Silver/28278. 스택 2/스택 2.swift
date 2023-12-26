let n = Int(readLine()!)!
var stack: [Int] = []
for _ in 1...n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    switch input[0] {
    case 1:
        stack.append(input[1])
    case 2:
        if let pop = stack.popLast() {
            print(pop)
        } else {
            print(-1)
        }
    case 3:
        print(stack.count)
    case 4:
        stack.isEmpty ? print(1) : print(0)
    case 5:
        stack.isEmpty ? print(-1) : print(stack.last!)
    default:
        break
    }
}