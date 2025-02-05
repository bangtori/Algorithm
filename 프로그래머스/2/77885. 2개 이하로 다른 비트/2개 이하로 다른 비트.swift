import Foundation

func solution(_ numbers: [Int64]) -> [Int64] {
    return numbers.map { num in
        if num % 2 == 0 { 
            return num + 1 
        } else {
            var binary = Array(String(num, radix: 2)) 
            
            var foundZero = false

            for i in stride(from: binary.count - 1, through: 0, by: -1) {
                if binary[i] == "0" {
                    binary[i] = "1"
                    binary[i + 1] = "0"
                    foundZero = true
                    break
                }
            }
            
            if !foundZero {
                binary.insert("1", at: 0)
                binary[1] = "0"
            }
            
            return Int64(String(binary), radix: 2)!
        }
    }
}