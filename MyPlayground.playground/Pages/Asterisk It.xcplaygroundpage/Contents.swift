//: [Previous](@previous)

import Foundation

extension String {
    func separate(every stride: Int = 4, with separator: Character = " ") -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
    func joinIntoStr (array:[Int]) -> String {
            var str:String = ""
        for (index, item) in array.enumerated() {
                str += "\(item)"
                if index < array.count-1 {
                    str += self
                }
            }
            return str
        }
}

func isEven (num: Int) -> Bool {
    if num%2==0 {
       return true
    }
    else{
        return false
    }
}


func asteriskString (digits: String) -> String {
    //1243567 // 1 2 4 3 5 6 7
    var result = ""
    let str = digits.separate(every: 1, with:"-")
    let ints = str.components(separatedBy: "-") // 1 2 4 3 5 6 7
    for i in 0..<ints.count-1{
        result += ints[i]
        if isEven(num: Int(String(ints[i]))!) && isEven(num: Int(String(ints[i+1]))!)  {
            result += "*"
        }
    }
    
    return result + ints[ints.count-1]
}

func asteriskIntArray (digits: [Int]) -> String {
    let str = ",".joinIntoStr(array: digits)
    var result = ""
    let ints = str.components(separatedBy: ",") // 1 2 4 3 5 6 7
    for i in 0..<ints.count-1{
        result += ints[i]
        if isEven(num: Int(String(ints[i]))!) && isEven(num: Int(String(ints[i+1]))!)  {
            result += "*"
        }
    }
    
    return result + ints[ints.count-1]
}

func asteriskIt (_ digits:Any) -> String {
    if digits is String{
        let str = String(describing: digits)
        return asteriskString(digits: str)
    }
    if digits is Array<Int>{
        let nums: [Int] = digits as! [Int]
        return asteriskIntArray(digits: nums)
        }
    else {
        return String(describing: digits)
    }
}

print(asteriskIt([1,2,4,2]))
 
//5312708     -->  "5312*70*8"




//"0000"      -->  "0*0*0*0"
//[1, 4, 64]  -->  "14*6*4"

//: [Next](@next)
