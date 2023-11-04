func solution(_ s:String) -> String {
    var result = ""
    var flag = true
    for c in s {
        if flag == true && !c.isNumber && c != " "{
            result += c.uppercased()
        } else if flag == false && !c.isNumber && c != " "{
            result += c.lowercased()
        } else {
            result += String(c)
        }
        flag = false
        if c == " " {
            flag = true
        }
    }
    return result
}



