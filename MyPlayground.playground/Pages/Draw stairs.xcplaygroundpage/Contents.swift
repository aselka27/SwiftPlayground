//: [Previous](@previous)

import Foundation

func drawStairs (num: Int) -> String {
    if num > 1{
        var str = ""
        for i in 1..<num{
           str = str + "I"+"\n" + String(repeating: " ", count: i)
        }
        return str + "I"
    }
    else{
        return "I"
    }
}
print(drawStairs(num: 7))

//: [Next](@next)

