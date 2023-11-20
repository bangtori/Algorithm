import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = ""
    var currentRight = "#"
    var currentLeft = "*"
    let hightDic = ["1" : 4, "2": 4, "3":  4, 
                        "4": 3, "5": 3, "6": 3, 
                        "7": 2, "8": 2, "9" : 2, 
                        "*": 1, "0": 1, "#": 1]
    for number in numbers {
        switch number {
        case 1,4,7 :
            result.append("L")
            currentLeft = String(number)
        case 3,6,9 :
            result.append("R")
            currentRight = String(number)
        case 2,5,8,0 :
            let rightDistance = ["3", "6", "9", "#"].contains(currentRight) ? abs(hightDic[currentRight]!-hightDic[String(number)]!) + 1 : abs(hightDic[currentRight]!-hightDic[String(number)]!)
            let leftDistance = ["1", "4", "7", "*"].contains(currentLeft) ? abs(hightDic[currentLeft]!-hightDic[String(number)]!) + 1 : abs(hightDic[currentLeft]!-hightDic[String(number)]!)
            var moveHand = "right"
            if rightDistance == leftDistance {
                moveHand = hand 
            } else if rightDistance > leftDistance {
                moveHand = "left"
            } else {
                moveHand = "right"
            }
            if moveHand == "right" {
                result.append("R")
                currentRight = String(number)
            } else {
                result.append("L")
                currentLeft = String(number)
            }
        default: 
            break
        }
    }
    return result
}