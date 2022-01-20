//: [Previous](@previous)

import Foundation


func mumbling(s: String) -> String {
    var str = [String]()

       for (i, c)in s.enumerated() {
           let repeatStr = String(repeating: c, count: i+1)
           str.append((repeatStr).capitalized)
       }
       return str.joined(separator: "-")
}
var word = "abcd"
print(mumbling(s: word))


    

