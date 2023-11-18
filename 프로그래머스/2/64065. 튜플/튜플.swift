import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    var result = [Int]()
    s.removeFirst(2)
    s.removeLast(2)
    var arr = s.components(separatedBy: "},{").map{
        $0.components(separatedBy: ",").map{Int($0)!}
    }.sorted {
        $0.count < $1.count
    }

    for i in arr {
        i.map {
            if !result.contains($0) {
                result.append($0)
            }
        }
    }
    return result
}