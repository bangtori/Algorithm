import Foundation

func getMode(_ dic: [Int: Int]) -> Int {
    let sortedDic = dic.sorted { (first, second) in
        if first.value == second.value {
            return first.key < second.key
        }
        return first.value > second.value }
    if sortedDic.count >= 2 {
        if sortedDic[0].value != sortedDic[1].value {
            return sortedDic[0].key
        }else {
            return sortedDic[1].key
        }
    }else {
        return sortedDic[0].key
    }
}

let n = Int(readLine()!)!
var numbers = [Int]()
var sum = 0.0
var numberCounting = [Int: Int]()

for _ in 1...n {
    let input = Int(readLine()!)!
    numbers.append(input)
    sum += Double(input)
    if numberCounting[input] != nil {
        numberCounting[input] = numberCounting[input]! + 1
    } else {
        numberCounting[input] = 1
    }
}
numbers.sort()
print(Int(round(sum/Double(n))))
print(numbers[n/2])
print(getMode(numberCounting))
print(numbers.max()! - numbers.min()!)