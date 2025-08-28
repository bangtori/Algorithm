struct Belt {
    private var belt: [(durability: Int, isRobot: Bool)]
    private var n : Int {
        return belt.count / 2
    }
    init (arr: [Int]) {
        belt = arr.map{($0, false)}
    }
    var zeroDurabilityCount: Int {
        return belt.filter { $0.durability == 0 }.count
    }
    mutating func lotate() {
        if belt[n-1].isRobot == true {
            belt[n-1].isRobot = false
        }
        let last = belt.removeLast()
        belt = [last] + belt
    }
    
    mutating func moveRobot() {
        for i in stride(from: n-1, through: 0, by: -1) {
            if i == n-1 && belt[i].isRobot {
                // 하차
                belt[i].isRobot = false
                continue
            }
            
            if belt[i].isRobot && !belt[i+1].isRobot && belt[i+1].durability > 0 {
                belt[i].isRobot = false
                belt[i+1].isRobot = true
                belt[i+1].durability -= 1
            }
        }
    }
    
    mutating func addRobot() {
        if belt[0].durability > 0 {
            belt[0].isRobot = true
            belt[0].durability -= 1
        }
    }
}

let info = readLine()!.split(separator: " ").map{Int($0)!}
let (n, k) = (info[0], info[1])
let beltInfo = readLine()!.split(separator: " ").map{Int($0)!}

var belt = Belt(arr: beltInfo)
var step = 0
while belt.zeroDurabilityCount < k {
    step += 1
    belt.lotate()
    belt.moveRobot()
    belt.addRobot()
}
print(step)
