//: [Previous](@previous)

import Foundation
extension Int {
    static func parse(from string: String) -> Int? {
        return Int(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
    }
}

func extractNum (str: String) -> Int {
    var num: Int = 0
    for char in str {
        if char.isNumber {
            num = Int(String(char))!
        }
    }
    return num
}
//func order (sentence: String) -> String {
//    var arr = [String]()
//    let sentenceArray = sentence.components(separatedBy: [" "]) // "is2" "Thi1s" "T4est" "3a"
//    for n in sentenceArray {
//        let num = extractNum(str: n)
//        arr.insert(n, at: num-1)
//    }
//    return arr.joined(separator: " ")
//}

func order (sentence: String) -> String {
    var digits = [Int]()
    var finalResult = ""
    let sentenceArray = sentence.components(separatedBy: [" "])
    for word in sentenceArray {
        var num = extractNum(str:word)
        digits.append(num)
    }
    for num in digits.sorted(){
        for word in sentenceArray {
            if word.contains(String(num)){
                finalResult = finalResult + " " + word
            }
        }
    }
    return finalResult
    
}


print(order(sentence: "is2 Thi1s T4est 3a"))

// "is2 Thi1s T4est 3a"

