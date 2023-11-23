import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var time = 0
    var truck = truck_weights
    var currentTruck:[(Int, Int)] = []
    var currentWeight = 0
    while !truck.isEmpty || !currentTruck.isEmpty {
        time += 1
        if let outTruck = currentTruck.first {
            if time - outTruck.1 == bridge_length {
                currentTruck.removeFirst()
                currentWeight -= outTruck.0
            }
        }
        if let current = truck.first {
            if currentTruck.count < bridge_length && currentWeight <= weight - current {
                currentTruck.append((current, time))
                currentWeight += current
                truck.removeFirst()
            }
        }
        
    }
    return time
}