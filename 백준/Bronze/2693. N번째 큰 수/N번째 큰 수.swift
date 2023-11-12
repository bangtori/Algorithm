for _ in 1...Int(readLine()!)! {
    let arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
    print(arr[2])
}