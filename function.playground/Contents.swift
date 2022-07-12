import UIKit
import Foundation
import os

func greet(name:String, day:String)->String{
    return "Hello \(name) today is \(day)"
}
func day(name:String, day:String)->String{
    return name+day
}
let msg1 = greet(name:"posite",day:"Monday")
var ff = greet
let msg2 = ff("posite","Monday")
ff = day
let msg3 = ff("posite","Monday")

func points(num:Int, bonus:(Int)->Bool)->Int{
    var pt = num*10
    if bonus(num){
        pt+=1
    }
    return pt
}
points(num: 5, bonus: {(num:Int)->Bool in
    return (num%2) != 0
})
let neg={(num:Int)->Bool in
    return num < 0
}
points(num:4,bonus:neg)
let pos = { $0 > 0}
pos(20)
pos(-30)
let mod2 = points(num:9, bonus: {($0 % 3)==0})
let mod3 = points(num:9){($0 % 3) == 0}
func odd(num:Int)->Bool{
    return (num%2) != 0
}
func negative(num:Int)->Bool{
    return num<0
}

points(num:5,bonus:odd)
points(num:6,bonus:odd)
points(num:7,bonus:negative)
points(num:-1,bonus:negative)

func incrementor(num:Int)->(()->Int){
    var value=0
    func increase()->Int{
        value += num
        return value
    }
    return increase
}

let inc3 = incrementor(num:3)
inc3()
inc3()

let inc7 = incrementor(num: 7)
inc7()
inc7()

inc3()

var numbers = [1,12,32,2,4,43,3]
numbers.sort{$0<$1}
numbers
numbers.sort(by: {n1,n2 in n1>n2})
numbers
numbers.sort(by: <)
