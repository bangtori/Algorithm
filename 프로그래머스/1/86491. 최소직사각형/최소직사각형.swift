import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var max: [Int] = []
    var min: [Int] = []
    
    for size in sizes {
        if size[0] < size[1] {
            max.append(size[1])
            min.append(size[0])
        } else {
            max.append(size[0])
            min.append(size[1])
        }
    }
    
    return max.max()! * min.max()!
}