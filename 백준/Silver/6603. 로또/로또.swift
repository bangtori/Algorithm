func combi(_ arr: [Int], target: Int) -> [[Int]] {
    var result = [[Int]]()
    
    func combination(_ current: [Int], _ currentIndex: Int) {
        if current.count == target {
            result.append(current)
            return
        }
        for i in currentIndex..<arr.count {
            combination(current + [arr[i]], i+1)
        }
    }
    combination([], 0)
    return result
}

while true {
    let input = readLine()!
    if input == "0" { break }
    let inputArr = input.split(separator: " ").map{Int($0)!}
    let k = inputArr[0]
    let s = Array(inputArr[1..<inputArr.count])
    let combiResult = combi(s, target: 6)
    
    combiResult.forEach { numbers in
        print(numbers.map{String($0)}.joined(separator: " "))
    }
    print()
}
