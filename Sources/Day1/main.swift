import Foundation
import Utils

// let input = try Utils.getInput(day: 1, file: "test.txt")
let input = try Utils.getInput(day: 1)

let items = input
.components(separatedBy: CharacterSet(charactersIn: ", \n"))
.map { (item) -> Int? in
    return Int(item)
}
.compactMap { $0 }

func part1(items: [Int]) -> Int {
    return items.reduce(0) { $0 + $1 }
}

print("Part 1: \(part1(items: items))")

func part2(items: [Int]) -> Int {
    var shift = 0
    var shifts: [Int: Bool] = [:]
    shifts[shift] = true
    while true {
        for change in items {
            shift += change
            if shifts[shift] ?? false {
                return shift
            }
            shifts[shift] = true
        }
    }
}

print("Part 2: \(part2(items: items))")
