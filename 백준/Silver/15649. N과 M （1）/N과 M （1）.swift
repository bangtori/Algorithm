let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, m) = (input[0], input[1])
func back(result: [Int]) {
    if result.count == m {
        print(result.map{String($0)}.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if !result.contains(i) {
            back(result: result + [i])
        }
    }
}
back(result: [])