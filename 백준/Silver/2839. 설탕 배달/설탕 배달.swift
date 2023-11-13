var n = Int(readLine()!)!
var result = 0
if n % 5 == 0 {
    result = n / 5
    n = 0
} else {
    var bag = 0
    while n > 0 {
        n -= 3
        result += 1
        if n % 5 == 0 {
            result += n/5
            n = 0
            break
        }
    }
}
if n != 0 {
    print(-1)
} else {
    print(result)
}