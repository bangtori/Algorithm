let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int($0)!}
var stack = [Int]()
var currentNumber = 1
var index = 0
var flag = true
while index < n {
    let pop = stack.popLast()
    if currentNumber == pop {
        currentNumber += 1
    } else {
        if let pop = pop { stack.append(pop) }
        if currentNumber == input[index] {
            currentNumber += 1
            index += 1
        } else {
            stack.append(input[index])
            index += 1
        }
    }
}
while !stack.isEmpty {
    if stack.popLast() != currentNumber {
        break
    }
    currentNumber += 1
}
stack.isEmpty ? print("Nice") : print("Sad")