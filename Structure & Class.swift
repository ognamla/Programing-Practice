//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

//property

struct CharacterState { //structure is value type(值型別)
    var hpValueMax :Double = 300 // hpValueMax called property(屬性)
    let mpValueMax :Double = 200
}

var oneState = CharacterState() //oneState called "instance"(實體)

//lazy stored property

class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()

manager.data.append("some data")
manager.data.append("some more data")

print(manager.importer.fileName)

//computed property - get & set
class GameCharacter {
    var hpValue:Double = 100
    var defenceValue:Double = 300
    var totalDefence: Double {
        get {
            return (defenceValue + 0.1 * hpValue)
        }
        set {
            hpValue = hpValue * (1 + newValue)
            defenceValue = defenceValue * (1 + newValue)
        }
    }
}

let oneCharacter = GameCharacter()

oneCharacter.totalDefence = 0.05 //相當於在set裡面先做計算 再丟到 return
oneCharacter.totalDefence
print("血量：\(oneCharacter.hpValue), 防禦力：\(oneCharacter.defenceValue)")
//由於(levelUp)沒有用到，可以改寫成 newValue, 再拿掉(levelUp)


//willSet & didSet
class SomeGameCharacter {
    var hpValue = 100 {
        willSet {
            print("新的血量為\(newValue)")// newValue 與 oldValue 不用特別宣告
        }
        didSet {
            if hpValue > oldValue {
                print("我補血了！")
            }
            else {
                print("我噴血了!")
            }
            
        }
    }
    
}
let anotherState = SomeGameCharacter()
anotherState.hpValue = 150


