func solution(_ s:String) -> String {
    let arr = s.split(separator: " ").map{ Int($0)! }
    let max = arr.max()!
    let min = arr.min()!
    return "\(min) \(max)"
}