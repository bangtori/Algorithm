import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var result = 0
    let wLen = 2 * w + 1  // 하나의 기지국이 커버하는 범위
    
    var prevEnd = 0  // 이전 기지국의 끝 부분

    for station in stations {
        let start = max(1, station - w)   // 현재 기지국의 시작점 
        let end = min(n, station + w)     // 현재 기지국의 끝점

        // 비전파 구간의 길이 계산
        let uncoveredLength = start - prevEnd - 1
        if uncoveredLength > 0 {
            result += (uncoveredLength + wLen - 1) / wLen  // 올림 계산
        }

        prevEnd = end  // 다음 기지국과 비교하기 위해 prevEnd 업데이트
    }

    // 마지막 기지국 이후의 비전파 구간 처리
    if prevEnd < n {
        let uncoveredLength = n - prevEnd
        result += (uncoveredLength + wLen - 1) / wLen  // 올림 계산
    }
    return result
}