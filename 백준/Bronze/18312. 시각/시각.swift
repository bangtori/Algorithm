extension Int {
    func formatTime() -> String {
        if self < 10 {
            return"0\(self)"
        }
        return String(self)
    }
}

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (n, k) = (input[0], input[1])
var count = 0
for h in 0...n {
    for m in 0...59 {
        for s in 0...59 {
            let time = h.formatTime() + m.formatTime() + s.formatTime()
            if time.contains(Character(String(k))) {
                count += 1
            }
        }
    }
}

print(count)
