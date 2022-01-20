//: [Previous](@previous)
import UIKit
import Foundation

func removeConsecutiveDuplicates (sentence: String) -> String {
    let sentenceArray = sentence.components(separatedBy: [" "])
    var str = " "
    for word in sentenceArray {
        if str == " " || word != str.components(separatedBy: " ").last {
            str = str + " " + word
        }
    }
    
    return str
}

//TEST 
var sentence = "alpha beta beta gamma gamma gamma delta alpha beta beta gamma gamma gamma delta"
print(removeConsecutiveDuplicates(sentence: sentence))
