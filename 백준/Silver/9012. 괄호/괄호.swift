let k = Int(readLine()!)!
for _ in 1...k {
    let input = readLine()!
    var stack = [Character]()
    var flag = false
    for c in input {
        if c == "(" {
            stack.append(c)
        } else {
            if let pop = stack.popLast() {
                continue
            }
            print("NO")
            flag = true
            break
        }
    }
    if flag {
        continue
    }
    if stack.isEmpty {
        print("YES")
    }else {
        print("NO")
    }
}