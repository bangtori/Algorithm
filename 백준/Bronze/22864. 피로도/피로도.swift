let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b, c, m) = (input[0], input[1], input[2], input[3])

var result = 0
var fatiguability = 0
for _ in 1...24 {
    if fatiguability + a <= m {
        result += b
        fatiguability += a
    } else {
        fatiguability -= c
        fatiguability = fatiguability < 0 ? 0 : fatiguability
    }
}
print(result)