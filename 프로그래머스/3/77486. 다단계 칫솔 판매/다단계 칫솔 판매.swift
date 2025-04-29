import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var sellerRelation: [String: String] = [:] // 본인 : 추천인
    for (i, name) in referral.enumerated() {
        if name != "-" {
            sellerRelation[enroll[i]] = name
        }
    }
    var sellerProfits: [String: Int] = Dictionary(uniqueKeysWithValues: enroll.map { ($0, 0) })
    
    for i in 0..<seller.count {
        var profit = amount[i] * 100
        var currentSellerName = seller[i]

        while true {
            let newProfit = Int(Double(profit) * 0.1)
            if newProfit < 1 {
                sellerProfits[currentSellerName]! += profit
                break
            }
            
            sellerProfits[currentSellerName]! += (profit - newProfit)
            profit = newProfit

            if let parentName = sellerRelation[currentSellerName] {
                currentSellerName = parentName
            } else {
                break
            }
        }
        
    }

    return enroll.map{ sellerProfits[$0]! }
}