struct Queue<T> {
  var memory = [T]()
  var index = 0
  var isEmpty: Bool {
    memory.count < index + 1
  }
  
  mutating func inQueue(element: T) {
    memory.append(element)
  }
  
  mutating func deQueue() -> T {
    let v = memory[index]
    index += 1
    return v
  }
}

let n = Int(readLine()!)!
var map = [[Int]]()
var sharkY = 0
var sharkX = 0

for i in 0..<n {
  let y = readLine()!.split(separator: " ").map { Int($0)! }
  map.append(y)
  
  if let j = y.firstIndex(of: 9) {
    sharkY = i
    sharkX = j
    map[i][j] = 0
  }
}

var size = 2
var eatCount = 0

func bfs() -> Int? {
  let dy = [1, 0, -1, 0]
  let dx = [0, 1, 0, -1]
  
  var visited = Array(repeating: Array(repeating: false, count: n),count: n)
  visited[sharkY][sharkX] = true
  
  var queue = Queue<(y: Int, x: Int, move: Int)>()
  queue.inQueue(element: (sharkY, sharkX, 0))
  
  var min = Int.max
  var fish = [(y: Int, x: Int)]()
  
  while !queue.isEmpty {
    let (y, x, move) = queue.deQueue()
    
    if move > min { continue }
    
    if (1..<size).contains(map[y][x]) {
      min = move
      fish.append((y, x))
    }
    
    for i in 0..<4 {
      let (nextY, nextX) = (y + dy[i], x + dx[i])
      if (0..<n).contains(nextY)
          && (0..<n).contains(nextX)
          && !visited[nextY][nextX]
          && map[nextY][nextX] <= size {
        visited[nextY][nextX] = true
        queue.inQueue(element: (nextY, nextX, move + 1))
      }
    }
  }
  
  if fish.isEmpty {
    return nil
  }
  
  fish.sort {
    if $0.y == $1.y {
      return $0.x < $1.x
    }
    return $0.y < $1.y
  }
  
  let sharkYX = fish.first!
  eatCount += 1
  
  if eatCount == size {
    size += 1
    eatCount = 0
  }
  
  map[sharkYX.y][sharkYX.x] = 0
  sharkY = sharkYX.y
  sharkX = sharkYX.x
  
  return min
}

var result = 0

while true {
  if let time = bfs() {
    result += time
  } else {
    print(result)
    break
  }
}