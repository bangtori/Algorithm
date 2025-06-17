import Foundation

func countCroatiaLettersRegex(input: String) -> Int {
    let pattern = "dz=|c=|c-|d-|lj|nj|s=|z="

    guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
        return input.count
    }

    let range = NSRange(input.startIndex..., in: input)
    let converted = regex.stringByReplacingMatches(in: input, options: [], range: range, withTemplate: "*")

    return converted.count
}

print(countCroatiaLettersRegex(input: readLine()!))