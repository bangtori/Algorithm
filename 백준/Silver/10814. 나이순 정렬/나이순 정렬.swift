typealias Member = (age: Int, name: String)
let n = Int(readLine()!)!
var members = [Member]()
for _ in 1...n {
    let member = readLine()!.split(separator: " ")
    members.append((Int(member[0])!, String(member[1])))
}

let sorted = members.sorted {
    return $0.age < $1.age
}

sorted.forEach { member in
    print("\(member.age) \(member.name)")
}