import Foundation

func check(_ word: String) -> Int {
    var word = word
    
    while !word.isEmpty {
        var matched = false
        
        for i in 1...12 {
            if word.count < 4 * i {
                return 0
            }
            let pattern = String(repeating: "w", count: i) +
            String(repeating: "o", count: i) +
            String(repeating: "l", count: i) +
            String(repeating: "f", count: i)
            
            if word.prefix(4 * i) == pattern {
                word.removeFirst(4 * i)
                matched = true
                break
            }
        }
        
        if !matched {
            return 0
        }
    }
    
    return 1
}


let word = readLine()!


print(check(word))