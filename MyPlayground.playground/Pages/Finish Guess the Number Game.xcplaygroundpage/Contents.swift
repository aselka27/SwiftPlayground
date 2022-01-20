//: [Previous](@previous)
import UIKit
import Foundation
enum TooManyGuesses: Error {
    case many
}
class Guesser {
    let number: Int
    var lives: Int
    init(number: Int, lives: Int) {
        self.number = number
        self.lives = lives
        
    }
    func Guess (n: Int) throws->Bool{
        if self.lives < 1{
            throw TooManyGuesses.many
        }
        if self.number == n {
            return true
        }
        self.lives -= 1
        return false
      
    }
    
}



   
    

