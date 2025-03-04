import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    let sortedData = data.sorted {
        if $0[col-1] == $1[col-1] {
            return $0[0] > $1[0]
        }
        return $0[col-1] < $1[col-1]
    }
    var result = 0
    for i in row_begin...row_end {
        let modResult = sortedData[i-1].reduce(0) {
            $0 + ($1 % i)
        }
        result = result^modResult
    }
    return result
}
