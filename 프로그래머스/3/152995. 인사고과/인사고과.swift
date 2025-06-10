import Foundation

func solution(_ scores:[[Int]]) -> Int {
    let sortedScores = scores.enumerated().map{ index, element in
        return [element[0], element[1], index]
    }.sorted {
        if $0[0] == $1[0] {
            return $0[1] < $1[1]
        }
        return $0[0] > $1[0]
    }
    
    var prevMaxSocre = 0
    var removeAfterScores:[Int: Int] = [:]
    for i in 0..<sortedScores.count {
        if sortedScores[0][0] > sortedScores[i][0] && prevMaxSocre > sortedScores[i][1] {
            continue
        }
        removeAfterScores[sortedScores[i][2]] = sortedScores[i][0] + sortedScores[i][1]
        prevMaxSocre = sortedScores[i][1]
    }

    
    return (removeAfterScores.sorted(by: {
        if $0.value == $1.value {
            return $0.key < $1.key
        }
        return $0.value > $1.value
    }).firstIndex(where: { $0.key == 0 }) ?? -2) + 1
}