import Foundation

struct MusicInfo {
    let startTime: String
    let endTime: String
    let title: String
    let music: String
    
    var playTime: Int {
        let startTimeComponents = startTime.split(separator: ":").compactMap{Int($0)}
        let endTimeComponents = endTime.split(separator: ":").compactMap{Int($0)}
        
        return (endTimeComponents[0] - startTimeComponents[0]) * 60 + (endTimeComponents[1] - startTimeComponents[1])
    }
    
    var playMyusic: String {
        if music.count > playTime {
            return String(music.prefix(playTime))
        } else {
            let repeatCount = playTime / music.count
            let remainCount = playTime % music.count
            return String(repeating: music, count: repeatCount) + String(music.prefix(remainCount))
        }
    }
}
func replaceSharpWithLowercase(music: String) -> String {
    let replacements: [String: String] = [
        "C#": "c", "D#": "d", "F#": "f",
        "G#": "g", "A#": "a", "B#": "b"
    ]
    
    var result = music
    
    for (sharp, lower) in replacements {
        result = result.replacingOccurrences(of: sharp, with: lower)
    }
    
    return result
}
func solution(_ m:String, _ musicinfos:[String]) -> String {
    var dic: [Int: MusicInfo] = [:]
    let replaceM = replaceSharpWithLowercase(music: m)

    for i in 0..<musicinfos.count {
        let musicinfo = musicinfos[i]
        let components = musicinfo.split(separator: ",")
        let music = MusicInfo(
            startTime: String(components[0]),
            endTime: String(components[1]),
            title: String(components[2]),
            music: replaceSharpWithLowercase(music: String(components[3]))
        )
        if music.playMyusic.contains(replaceM) {
            dic[i] = music
        }
    }
    if dic.isEmpty {
        return "(None)"
    }
    let sort = dic.sorted {
        if $0.value.playTime == $1.value.playTime {
            return $0.key < $1.key
        }
        return $0.value.playTime > $1.value.playTime
    }
    return sort[0].value.title
}