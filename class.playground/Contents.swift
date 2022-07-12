import Foundation

class Animal{
    var legCount : Int = 0
    var name :String
    init(name:String){
        self.name=name
    }
    func simpleDescription()->String{
        return "\(name) has \(legCount) legs"
    }
    
}
class Mammal : Animal{
    override init(name:String){
        super.init(name: name)
        legCount=4
    }
    func giveBirth()->Mammal{
        Mammal(name:"\(self.name)'s baby")
    }
}
class Dog : Mammal{
    func bark()->String{
        "bark!!"
    }
    override func giveBirth() -> Mammal {
        Dog(name: "\(self.name)'s baby")
    }
}
class Platypus:Mammal{
    override func giveBirth() -> Mammal {
        print("Laying an egg")
        return Platypus(name:"Baby \(self.name) from an egg")
    }
}
class Monster:Mammal{
    var kneeCount:Int{
        return legCount
    }
    var toeCount:Int{
        get{
            return 4 * legCount
        }
        set(v){
            legCount = v/4
        }
    }
    var eyeCount = 0{
        didSet{
            legCount = eyeCount * 2
        }
    }
}

let mo = Monster(name: "monster")
mo.legCount=20
mo.eyeCount
mo.eyeCount=20
mo.kneeCount
mo.toeCount=41
mo.kneeCount
mo.toeCount

let monster1 = Animal(name:"Lark")
monster1.simpleDescription()

let b = Animal(name:"dog")
b.legCount=4
b.simpleDescription()

let m = Mammal(name:"Elephant")
m.simpleDescription()

let eBaby = m.giveBirth()
eBaby.simpleDescription()

let d = Dog(name: "martiz")
d.simpleDescription()
d.bark()
let dd = d.giveBirth() as? Dog
if dd != nil{
    dd!.simpleDescription()
    dd!.bark()
}
//as?는 불확실한 경우 as는 컴파일러도 프로그래머도 아는것. as!는 컴파일러는 모르지만 프로그래머가 아는것
let mm = m as? Dog
let nd = mm?.simpleDescription()

let animals = [
    Mammal(name:"Elephant"),
    Dog(name: "martiz"),
    Platypus(name: "Platypus")
]
for a in animals{
    print(a.simpleDescription())
    print(a.giveBirth().simpleDescription())
}
