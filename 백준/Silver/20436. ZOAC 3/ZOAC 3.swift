let keyboard = [
    "q": (0, 0), "w": (1, 0), "e": (2, 0), "r": (3, 0), "t": (4, 0),
    "y": (5, 0), "u": (6, 0), "i": (7, 0), "o": (8, 0), "p": (9, 0),
    "a": (0, 1), "s": (1, 1), "d": (2, 1), "f": (3, 1), "g": (4, 1),
    "h": (5, 1), "j": (6, 1), "k": (7, 1), "l": (8, 1),
    "z": (0, 2), "x": (1, 2), "c": (2, 2), "v": (3, 2), "b": (4, 2),
    "n": (5, 2), "m": (6, 2)
]
let vowels = Set(["y", "u", "i", "o", "p", "h", "j", "k", "l", "b", "n", "m"])

let start = readLine()!.split(separator: " ").map{String($0)}
var left = start[0]
var right = start[1]

var string = Array(readLine()!).map{String($0)}

var count = 0
for c in string {
    let leftDistance = abs(keyboard[left]!.0 - keyboard[c]!.0) + abs(keyboard[left]!.1 - keyboard[c]!.1)
    let rightDistance = abs(keyboard[right]!.0 - keyboard[c]!.0) + abs(keyboard[right]!.1 - keyboard[c]!.1)
    
    if vowels.contains(c) {
        let rightDistance = abs(keyboard[right]!.0 - keyboard[c]!.0) + abs(keyboard[right]!.1 - keyboard[c]!.1)
        count += rightDistance
        right = c
    } else {
        let leftDistance = abs(keyboard[left]!.0 - keyboard[c]!.0) + abs(keyboard[left]!.1 - keyboard[c]!.1)
        count += leftDistance
        left = c
    }
    count += 1
}

print(count)
