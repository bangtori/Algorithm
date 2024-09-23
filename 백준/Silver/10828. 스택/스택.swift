let n = Int(readLine()!)!
var stack = [Int]()
for _ in 1...n {
    let command = readLine()!.split(separator: " ")
    switch command[0] {
    case "push":
        stack.append(Int(command[1])!)
    case "pop":
        if let pop = stack.popLast() {
            print(pop)
        } else {
            print(-1)
        }
    case "size":
        print(stack.count)
    case "empty":
        print(stack.isEmpty ? 1 : 0)
    case "top":
        if let last = stack.last {
            print(last)
        } else {
            print(-1)
        }
    default:
        break
    }
}