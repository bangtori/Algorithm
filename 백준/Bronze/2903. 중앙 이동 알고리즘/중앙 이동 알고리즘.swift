let n = Int(readLine()!)!
var points = 2
for _ in 1...n {
    points += (points-1)
}

print(points*points)