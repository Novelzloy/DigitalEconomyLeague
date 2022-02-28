import Foundation


protocol Telephone {
    var phoneNumber: String {get set}
    func call()
    func nangUp()
}

extension Telephone{
    func call(){
        // call
    }
    func hangUp(){
        // hang up
    }
}

protocol Landline: Telephone{
    
}

class Person {
    func toAnswerCall(_ telephone: Telephone){
        
    }
    var name: String
    
    init(name: String){
        self.name = name
    }
}


protocol Cellular: Telephone{
    func sendMessage()
}

protocol Rotaryable{
    func rotaryInput()
}

protocol PushButton{
    func buttonInput()
}

protocol Touchable{
    func touchInput()
}


class RotaryPhone: Landline, Rotaryable {
    
    let person = Person(name: "Roman")
    
    func rotaryInput() {
        // input with rotate
    }
    
    var phoneNumber: String
    
    init (phoneNumber: String){
        self.phoneNumber = phoneNumber
    }
    
    func nangUp() {
        // nung up
    }
    
    func call() {
        person.toAnswerCall(RotaryPhone(phoneNumber: ""))
    }
    
}

class PushBattonPhone: Landline, PushButton{
    func buttonInput() {
        // input button
    }
    
    var phoneNumber: String
    
    init (phoneNumber: String){
        self.phoneNumber = phoneNumber
    }
    
    func nangUp() {
        // hang up
    }
    
}

class NonSmartPhone: Cellular, PushButton{
    func sendMessage() {
        // send sms
    }
    
    func buttonInput() {
        // input button
    }
    
    var phoneNumber: String
    
    init (phoneNumber: String){
        self.phoneNumber = phoneNumber
    }
    
    func nangUp() {
        // hang up
    }
    
}

class Smartphone: Cellular, Touchable{
    func sendMessage() {
        // send sms
    }
    
    func touchInput() {
        // input button
    }
    
    var phoneNumber: String
    
    init (phoneNumber: String){
        self.phoneNumber = phoneNumber
    }
    
    func nangUp() {
        // hang up
    }
    
    
}
