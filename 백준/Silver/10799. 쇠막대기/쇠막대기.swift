let input = readLine()!
var preChar: Character?
var stack: [Character] = []
var count = 0
for char in input {
    if char == "(" {
        stack.append(char)
    } else {
        // char == ")"
        let pop = stack.popLast()
        if pop == nil { continue }
        if preChar == "(" {
            // 레이저
            count += stack.count
        } else {
            count += 1
        }
    }
    preChar = char
}

print(count)