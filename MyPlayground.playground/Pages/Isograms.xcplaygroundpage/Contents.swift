//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"
func isIsogram (word: String) -> Bool {
    var nums = Set <Character>()
    for char in word {
        nums.insert(char)
    }
    if nums.count == word.count {
        return true
    } else{
        return false }
    
}

var letter = "aab"
print(isIsogram(word: letter))

//: [Next](@next)
