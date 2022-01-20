//: [Previous](@previous)

import Foundation
func getFrequency (arr: [Int], nums: [Int])->[[Int]]{
    var result = [[Int]]()
    var count = 0
    for n in nums{
        for m in arr {
            if n==abs(m){
                count+=1
               // result.append([n,count])
            }
        }
        result.append([n,count])
        count = 0
        
        
        }
    return result
}
var nums: [Int] = [2,4,5,6,5,3,2,3,3,4,3]
var nums2: [Int] = [3,5]
var arr: [[Int]] = getFrequency(arr: nums, nums: nums2)
for i in arr{
    for j in arr{
        print(j)
    }
}

//: [Next](@next)
//integers_list =  [1, 1, 2 ,3 ,1 ,2 ,3 ,4]
//digits_list = [1, 3]
//l.count_spec_digits(integers_list, digits_list) == [(1, 3), (3, 2)]
