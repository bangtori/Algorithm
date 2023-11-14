var result = 1
let n = Int(readLine()!)!
if n > 0 {
    for i in 1...n {
        result *= i
    }
}
print(result)