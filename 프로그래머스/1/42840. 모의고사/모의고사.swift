import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let studentAnswers = [[1, 2, 3, 4, 5], [2, 1, 2, 3, 2, 4, 2, 5], [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]]
    var result: [Int] = []
    var scores: [Int] = [0, 0, 0]
    
    for (i, answer) in answers.enumerated() {
        for (j, studentAnswer) in studentAnswers.enumerated() {
            if studentAnswer[i % studentAnswer.count] == answer {
                scores[j] += 1
            }
        }
    }
    var maxScore = scores.max()!
    for (i, score) in scores.enumerated() {
        if score == maxScore {
            result.append(i+1)
        }
    }
    return result
}