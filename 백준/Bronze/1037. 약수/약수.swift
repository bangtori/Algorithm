let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
if arr.count == 1 {
    print(arr[0] * arr[0])
} else {
    arr.sort()
    print(arr.first! * arr.last!)
}