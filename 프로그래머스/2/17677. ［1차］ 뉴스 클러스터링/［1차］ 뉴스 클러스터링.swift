func makeArray(_ str: String) -> [String] {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    let str = Array(str).map { String($0) }
    
    var results: [String] = []
    if !str.isEmpty {
        for i in 0..<str.count-1 {
            let ch1 = str[i].lowercased()
            let ch2 = str[i+1].lowercased()
            guard alphabet.contains(ch1), alphabet.contains(ch2) else {
                continue
            }
            
            results.append(ch1 + ch2)
        }
    }
    
    return results
}
func solution(_ str1:String, _ str2:String) -> Int {
    var arr1: [String] = makeArray(str1)
    var arr2: [String] = makeArray(str2)
    
    var intersection: [String] = []
    arr1.forEach {
        if let i = arr2.firstIndex(of: $0) {
            arr2.remove(at: i)
            intersection.append($0)
        }
    }
    var union: [String] = arr1 + arr2
    if intersection.isEmpty && union.isEmpty {
        return 65536
    }
    let result = Double(intersection.count) / Double(union.count) * 65536
    return Int(result)
}