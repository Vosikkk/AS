
import Foundation

let test = """

Time:      7  15   30
Distance:  9  40  200

"""

let data = """
Time:        48     93     85     95
Distance:   296   1928   1236   1391
"""



// MARK: --- Task1 ---

let lines = data.components(separatedBy: "\n")

let timeDistance = zip(
    data.components(separatedBy: "\n")[0].components(separatedBy: ":")[1].split(separator: " ").compactMap { Int($0) },
    data.components(separatedBy: "\n")[1].components(separatedBy: ":")[1].split(separator: " ").compactMap { Int($0) }
)

let resultTask1 = timeDistance.reduce(1) { (acc, pair) in
    let (time, distance) = pair
    let beatRecordCount = (0..<time).filter { (time - $0) * $0 > distance }.count
    return acc * beatRecordCount
}



// MARK: --- Task2 ---

let time = Int(lines[0].split(separator: ":")[1].split(separator: " ").joined())
let distance = Int(lines[1].split(separator: ":")[1].split(separator: " ").joined())

func waysToWin(time: Int, distance: Int) -> Int {
    
    // Calculate the roots of the quadratic equation.
    let a = (Double(time) - sqrt(pow(Double(time), 2) - 4 * Double(distance))) / 2
    let b = (Double(time) + sqrt(pow(Double(time), 2) - 4 * Double(distance))) / 2
    
    // This is because the number of ways to win is the number of integers between 'a' and 'b', inclusive.
    return Int(floor(b) - ceil(a) + 1)
}
let resultTask2 = waysToWin(time: time!, distance: distance!)

print("""
Task1: \(resultTask1)
Task2: \(resultTask2)
""")




     
