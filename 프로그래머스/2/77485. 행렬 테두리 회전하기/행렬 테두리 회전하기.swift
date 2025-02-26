import Foundation
enum Derection: Int {
    case right = 0
    case down = 3
    case left = 2
    case up = 1
}
struct RotateRange {
    let leftTop: (Int, Int)
    let rightTop: (Int, Int)
    let leftBottom: (Int, Int)
    let rightBottom: (Int, Int)
    
    init(_ query: [Int]) {
        leftTop = (query[0]-1, query[1]-1)
        rightTop = (query[0]-1, query[3]-1)
        leftBottom = (query[2]-1, query[1]-1)
        rightBottom = (query[2]-1, query[3]-1)
    }
    var loop: [(Derection, [Int])] {
        return [(.right, Array(leftTop.1...rightTop.1)),
                (.down, Array(rightTop.0...rightBottom.0)),
                (.left, Array(stride(from: rightBottom.1, through: leftBottom.1, by: -1))),
                (.up, Array(stride(from: leftBottom.0, through: leftTop.0, by: -1)))
        ]
    }
}
func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var graph = [[Int]]()
    var arr = [Int]()
    for i in 1...rows*columns {
        arr.append(i)
        if i % columns == 0 {
            graph.append(arr)
            arr = []
        }
    }
    var minValues = [Int]()
    func rotate(_ query: [Int]) {
        var minValue = rows*columns+1
        var newGraph = graph
        let rotateRange = RotateRange(query)
        for (derection, range) in rotateRange.loop {
            for i in 1..<range.count {
                if i == range.first {}
                switch derection {
                case .right, .left:
                    let y = query[derection.rawValue]-1
                    let newX = range[i-1]
                    let x = range[i]
                    minValue = min(minValue, graph[y][x])
                    newGraph[y][x] = graph[y][newX]
                case .down, .up:
                    let x = query[derection.rawValue]-1
                    let newY = range[i-1]
                    let y = range[i]
                    minValue = min(minValue, graph[y][x])
                    newGraph[y][x] = graph[newY][x]
                }
            }
        }
        graph = newGraph
        minValues.append(minValue)
    }
    for query in queries {
        rotate(query)
    }
    return minValues
}