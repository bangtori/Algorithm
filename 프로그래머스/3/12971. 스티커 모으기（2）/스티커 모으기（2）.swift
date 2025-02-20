import Foundation

struct DpItem {
    let remove: Int
    let noRemove: Int
    
    func maxItem() -> Int {
        return max(self.remove, self.noRemove)
    }
}

func solution(_ sticker:[Int]) -> Int {
    if sticker.count == 1 {
        return sticker[0]
    }
    var firstRemoveDP = [DpItem](repeating: DpItem(remove: 0, noRemove: 0), count: sticker.count)
    var firstNoRemoveDP = [DpItem](repeating: DpItem(remove: 0, noRemove: 0), count: sticker.count)
    firstRemoveDP[0] = DpItem(remove: sticker[0], noRemove: sticker[0])
    firstRemoveDP[1] = DpItem(remove: sticker[0], noRemove: sticker[0])
    
    firstNoRemoveDP[0] = DpItem(remove: 0, noRemove: 0)
    firstNoRemoveDP[1] = DpItem(remove: sticker[1], noRemove: 0)
    
    for i in 2..<sticker.count {
        if i == sticker.count-1 {
            firstRemoveDP[i] = firstRemoveDP[i-1]
        } else {
            firstRemoveDP[i] = DpItem(remove: firstRemoveDP[i-1].noRemove+sticker[i], noRemove: firstRemoveDP[i-1].maxItem())
        }
        firstNoRemoveDP[i] = DpItem(remove: firstNoRemoveDP[i-1].noRemove+sticker[i], noRemove: firstNoRemoveDP[i-1].maxItem())
    }

    return max(firstRemoveDP.last!.maxItem(), firstNoRemoveDP.last!.maxItem())
}