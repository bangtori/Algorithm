import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var indexDict = [String: [Int]]()
    var playCountDic = [String: Int]()
    for i in 0..<genres.count {
        indexDict[genres[i], default: []].append(i)
        playCountDic[genres[i], default: 0] += plays[i]
    }
    let sortedGenres = playCountDic.sorted { $0.value > $1.value }.map { $0.key }
    var result = [Int]()
    print(playCountDic)
    print(indexDict)
    for genre in sortedGenres {
        guard let genreIndex = indexDict[genre] else { continue }
        let sortedIndex = genreIndex.sorted {
            if plays[$0] == plays[$1] {
                return $0 < $1
            }
            return plays[$0] > plays[$1]
        }
        if sortedIndex.count > 2 {
            result += sortedIndex[0..<2]
        } else {
            result += sortedIndex
        }
    }
    return result
}