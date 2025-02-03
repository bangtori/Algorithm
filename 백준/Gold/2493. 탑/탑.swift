let n = Int(readLine()!)!
var tops = readLine()!.split(separator: " ").map{Int($0)!}
var stack = [(index: Int, value: Int)]()
var result = [Int](repeating: 0, count: n)
var currentIndex = n-1
stack.append((currentIndex, tops[currentIndex]))

repeat {
    let nextTopIndex = currentIndex - 1
    let nextTopHight = tops[nextTopIndex]
    while let stackLast = stack.last, stackLast.value < nextTopHight {
        result[stackLast.index] = nextTopIndex+1
        stack.popLast()
    }
    stack.append((nextTopIndex, nextTopHight))
    currentIndex = nextTopIndex
} while currentIndex > 0

print(result.map{String($0)}.joined(separator: " "))