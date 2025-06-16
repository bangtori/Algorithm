var isGenerated = [Bool](repeating: false, count: 10001)

func d(_ n: Int) -> Int {
    return n + String(n).compactMap { $0.wholeNumberValue }.reduce(0, +)
}

// 생성자가 되는 수 마킹
for i in 1...10000 {
    let dn = d(i)
    if dn <= 10000 {
        isGenerated[dn] = true
    }
}

// 셀프 넘버만 출력
for i in 1...10000 {
    if !isGenerated[i] {
        print(i)
    }
}
