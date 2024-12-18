let n = Int(readLine()!)!
var people = Set<String>()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{String($0)}
    let (name, history) = (input[0], input[1])
    if history == "enter" {
        people.insert(name)
    } else {
        people.remove(name)
    }
}

people.sorted(by: >).forEach { name in
    print(name)
}