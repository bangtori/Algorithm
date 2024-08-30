import Foundation

let html = readLine()!

// <main> 태그 내부의 내용 추출
if let mainMatch = html.range(of: "<main>(.*?)</main>", options: .regularExpression) {
    let main = String(html[mainMatch])
    
    // <div title="..."> 태그 내부의 내용 추출
    let divRegex = try! NSRegularExpression(pattern: "<div title=\"(.*?)\">(.*?)</div>", options: [])
    //  div 정규 표현식과 일치하는 모든 부분을 찾기 -> div 구문을 찾아 배열로 반환
    let divMatches = divRegex.matches(in: main, options: [], range: NSRange(main.startIndex..., in: main))
    
    // div 문단 한개씩 순회
    for match in divMatches {
        //match.range(at: 1) "<div title=\"(.*?)\">(.*?)</div>" 에서 at 번째 정규표현식 매칭 결과 반환
        if let titleRange = Range(match.range(at: 1), in: main), // match 에서 1번 정규식 (title 부분)에 해당하는 결과를 찾, main 문자열에서 해당 범위에 해당하는 String.Index 범위를 생성
           let paragraphRange = Range(match.range(at: 2), in: main) {
            let title = String(main[titleRange])
            let paragraph = String(main[paragraphRange])
            
            print("title :", title)
            
            // <p> 태그 내부의 내용 추출
            let pRegex = try! NSRegularExpression(pattern: "<p>(.*?)</p>", options: [])
            let pMatches = pRegex.matches(in: paragraph, options: [], range: NSRange(paragraph.startIndex..., in: paragraph))
            
            for pMatch in pMatches {
                if let pRange = Range(pMatch.range(at: 1), in: paragraph) {
                    var p = String(paragraph[pRange])
                    
                    // 태그 제거
                    p = p.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                    
                    // 공백 정리
                    p = p.replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression, range: nil)
                    p = p.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    print(p)
                }
            }
        }
    }
}