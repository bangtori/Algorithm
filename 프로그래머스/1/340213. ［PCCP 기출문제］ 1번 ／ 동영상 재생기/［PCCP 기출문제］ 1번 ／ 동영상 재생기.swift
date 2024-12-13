import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    let posArr = pos.split(separator: ":").map{Int($0)!}
    let opStartArr = op_start.split(separator: ":").map{Int($0)!}
    let opEndArr = op_end.split(separator: ":").map{Int($0)!}
    let videoLenArr = video_len.split(separator: ":").map{Int($0)!}
    
    var currentSec = posArr[1] + (60 * posArr[0])
    let opStartSec = opStartArr[1] + (60 * opStartArr[0])
    let opEndSec = opEndArr[1] + (60 * opEndArr[0])
    let videoLenSec = videoLenArr[1] + (60 * videoLenArr[0])
    
    for command in commands {
        // 오프닝 건너 뛰기
        if opStartSec <= currentSec && currentSec <= opEndSec {
            currentSec = opEndSec
        }
        switch command {
        case "next":
            currentSec += 10
            if currentSec > videoLenSec {
                currentSec = videoLenSec
            }
        case "prev":
            currentSec -= 10
            if currentSec < 0 {
                currentSec = 0
            }
        default:
            continue
        }
    }
    if opStartSec <= currentSec && currentSec <= opEndSec {
        currentSec = opEndSec
    }
    let min = currentSec / 60
    let sec = currentSec % 60

    return String(format: "%02d:%02d", min, sec)
}
