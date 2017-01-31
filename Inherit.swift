//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//instance method -> 就是將 func 藏在 class 裡面
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}



//subscript -> 下標，呼叫的方式為在代表此class的變數後加上[]
class SimpleMath {
    var sum = 500
    subscript (time: String) -> Int {
        return sum * 2
    }
    subscript (divided: Int) -> Int {
        return sum/divided
    }
}
var simpleMath = SimpleMath()

print(simpleMath["Hello"])
print(simpleMath[1])



//繼承
class GameCharacter {           // create a "base class"
    var attackSpeed = 0.0       // a base attack speed
    var description: String {   // a base description
        return "職業描述"
    }
    func attack() {             // attack method
    }
}

let oneCharacter = GameCharacter()

class Archer : GameCharacter {  // create a subclass from base class
    var attackRange = 2.5

}

let oneArcher = Archer()
oneArcher.attackSpeed = 2.0 //子類別直接繼承父類別的 attackspeed
print(oneArcher.attackSpeed)

class Hunter : Archer { // Archer 子類別 再被 Hunter 子類別繼承
    func fatalBlow() {
        print("施放必殺技！")
    }
}

let oneHunter = Hunter()

print("oneHunter 的 攻擊速度為\(oneHunter.attackSpeed)")

//複寫
//複寫方法
class OtherHunter : Archer {
     override func attack() {
        print("攻擊！這是獵人的攻擊！") // 父類別已定義過的，若要重新定義，則 override
    }
    
}

var otherHunter = OtherHunter()
oneCharacter.attack()

//存取父類別的屬性，方法及下標
class GoodHunter : Archer {
    override var description: String {
        return super.description + " : 精通箭術的獵人"
    }

}

var goodHunter = GoodHunter()
print(goodHunter.description)
