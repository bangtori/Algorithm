var n = Int(readLine()!)!
var start = 0
var end = 1
var count = 1
var multi = 1
while true {
    if n >= start && n <= end {
        print(count)
        break
    } else {
        start = end + 1
        end = multi * 6 + 1
        count += 1
        multi += count
    }
}