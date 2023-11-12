func GCD(_ a: Int, _ b: Int) -> Int {
    var (a, b) = (a, b)
    while (a % b != 0) {
        let r = a % b
        a = b
        b = r
    }
    return b
}

let input = readLine()!.split(separator: " ").map{Int($0)!}
let gcd = GCD(input[0], input[1])

print(gcd)
print(input[0] * input[1] / gcd)