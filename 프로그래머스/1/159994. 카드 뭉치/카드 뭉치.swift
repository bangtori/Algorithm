import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var tempCards1 = cards1
    var tempCards2 = cards2
    var result = "Yes"
    
    for i in goal {
        if tempCards1.first == i {
            tempCards1.removeFirst()
        } else if tempCards2.first == i {
            tempCards2.removeFirst()
        } else {
            result = "No"
            break
        }
    }
    
    return result
}