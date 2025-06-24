let t = Int(readLine()!)!
for _ in 1...t {
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let (_, target) = (info[0], info[1])
    var documents = Array(readLine()!.split(separator: " ").map{Int($0)!}).enumerated().map { index, value in
        return (index, value)
    }
    var count = 1
    while !documents.isEmpty {
        let current = documents.removeFirst()
        if documents.contains(where: {$0.1 > current.1}) {
            documents.append(current)
            continue
        }
        if current.0 == target {
            print(count)
            break
        }
        count += 1
    }
}
