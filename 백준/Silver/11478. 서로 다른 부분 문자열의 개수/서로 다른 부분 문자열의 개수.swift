let input = readLine()!
let arr = Array(input)
var subStringSet = Set<String>()

for i in 0..<arr.count {
    var substring = ""
    for j in i..<arr.count {
        substring.append(arr[j])
        subStringSet.insert(substring)
    }
}
print(subStringSet.count)