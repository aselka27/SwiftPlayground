//: [Previous](@previous)

import Foundation

func removeMarkedElements (num: [Int], deleteElements: [Int]) -> [Int] {
    var result = [Int]()
    result = num.filter{!deleteElements.contains($0)}
    return result
}


//TEST
print(removeMarkedElements(num: [1,2,2,3,4], deleteElements: [1,2]))







//: [Next](@next)
