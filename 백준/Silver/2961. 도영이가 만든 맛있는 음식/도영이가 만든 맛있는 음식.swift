func combi(arr: [(Int, Int)], target: Int) -> [[(Int, Int)]]{
    var result = [[(Int, Int)]]()
    func combination(start: Int, current: [(Int, Int)]) {
        if current.count == target {
            result.append(current)
            return
        }
        for i in start..<arr.count {
            combination(start: i+1, current: current+[arr[i]])
        }
    }
    combination(start: 0, current: [])
    return result
}

let n = Int(readLine()!)!
var materiales = [(Int, Int)]()
for _ in 1...n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    materiales.append((input[0], input[1]))
}

var subset = [[(Int, Int)]]()

for i in 1...n {
    subset.append(contentsOf: combi(arr: materiales, target: i))
}

var minValue = Int64.max

subset.forEach { list in
    let sum = list.reduce(0) { $0 + Int64($1.1) }
    let mutifly = list.reduce(1) { $0 * Int64($1.0) }
    minValue = minValue > abs(sum - mutifly) ? abs(sum - mutifly) : minValue
}

print(minValue)