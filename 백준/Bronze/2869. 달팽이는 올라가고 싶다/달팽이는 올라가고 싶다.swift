let input = readLine()!.split(separator: " ").map{Int($0)!}
let (a,b,v) = (input[0], input[1], input[2])
if v <= a {
    print(1)
} else {
    (v-a) % (a-b) == 0 ? print((v-a) / (a-b) + 1) : print((v-a) / (a-b) + 2)
}
