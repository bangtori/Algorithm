let info = readLine()!.split(separator: " ").map{ Int($0)! }

func pow(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if b == 1 { return a % c }

    let half = pow(a, b / 2, c)
    let result = (half * half) % c

    return b % 2 == 0 ? result : (result * a) % c
}

print(pow(info[0], info[1], info[2]))