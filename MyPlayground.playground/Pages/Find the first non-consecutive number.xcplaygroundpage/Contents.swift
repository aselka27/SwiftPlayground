//: [Previous](@previous)

import Foundation
func getNumber (digits: [Int]) -> Int {
    var result: Int?
    for i in 0..<digits.count-1  {
    if (digits[i] + 1) != digits[i+1] {
    result = digits[i+1]
    break
    }
    else {
    result = nil
    }
    }
    return result!
}
print(getNumber(digits: [1,3,3,4,5]))

//: [Next](@next)
