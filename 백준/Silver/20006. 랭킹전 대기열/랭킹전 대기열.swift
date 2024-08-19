var currentRoom: Int = 1
let input = readLine()!.split(separator: " ").map{Int($0)!}
let (p, m) = (input[0], input[1])
/// 중간고사 문제1
class Room {
    let roomId: Int
    let writer: User
    var members: [User]
    var maxPerson: Int
    var curretPerson: Int
    
    init(user: User) {
        self.roomId = currentRoom
        currentRoom += 1
        self.writer = user
        self.members = [user]
        self.maxPerson = m
        self.curretPerson = 1
    }
    
    var isMax: Bool {
        return curretPerson == maxPerson
    }
    
    var tierRange: Range<Int> {
        return writer.level-10..<writer.level+11
    }
    
    func inserUser(user: User) {
        self.members.append(user)
        self.curretPerson += 1
    }
}

struct User {
    let email: String
    let level: Int
}

var rooms: [Room] = []

for _ in 1...p {
    let userInfo = readLine()!.split(separator: " ")
    let user = User(email: String(userInfo[1]), level: Int(userInfo[0])!)
    
    var flag = false
    for room in rooms {
        if !room.isMax && room.tierRange ~= user.level {
            flag = true
            room.inserUser(user: user)
            break
        }
    }
    
    if !flag {
        // user를 넣지 못했으면 새 방 생성
        let newRoom = Room(user: user)
        rooms.append(newRoom)
    }
}

for room in rooms {
    if room.isMax {
        print("Started!")
    } else {
        print("Waiting!")
    }
    
    let sortedUser = room.members.sorted { $0.email < $1.email }

    for member in sortedUser {
        print("\(member.level) \(member.email)")
    }
}