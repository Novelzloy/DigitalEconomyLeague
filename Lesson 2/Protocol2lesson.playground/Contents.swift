import CoreGraphics
enum HeroAttackStyle: Int {
    case melee
    case longRange
}

extension HeroAttackStyle {
    var descriptionAttack: String{
        switch self{
        case .melee:
            return "melee attack!"
        case .longRange:
            return "long range attack!"
        }
    }
}

protocol Heroes {
    
    var armor: Float? { get }
    var attackPower: Float? { get }
    var strength: Float? { get }
    var agility: Float? { get }
    var intelligence: Float? { get }
    var hitPoints: Float? { get }
    var mana: Float? { get }
    
    func info()
}

protocol AttackableСharacter {
    var attack: HeroAttackStyle{ get }
}

extension AttackableСharacter {
    func attack() -> String {
        switch attack {
        case .longRange:
            return(attack.descriptionAttack)
        case .melee:
            return(attack.descriptionAttack)
        }
    }
}

protocol MoveableСharacter {
    var currentPosition: CGPoint { get }
    
    mutating func fly(to point: CGPoint)
    mutating func move(to point: CGPoint)
}

extension MoveableСharacter {
    func stop(){
        print("stop at current position \(currentPosition)")
    }
}


protocol StopAndMove: MoveableСharacter { }

protocol Ultimate {
     func ultimate()
}

struct Archmage: Heroes, StopAndMove, AttackableСharacter {
    mutating func fly(to point: CGPoint) {
        print(" Сharacter fly to \(point) points")
    }
    
    var attack: HeroAttackStyle
    
    var currentPosition: CGPoint
    
    mutating func move(to point: CGPoint) {
        print("Сharacter move to \(point) points")
    }
    

    var armor: Float?
    
    var attackPower: Float?
    
    var strength: Float?
    
    var agility: Float?
    
    var intelligence: Float?
    
    var hitPoints: Float?
    
    var mana: Float?
    
    
    func info() {
        print("\(String(describing: self))")
    }
    
    func stop() {
        print("stop")
    }
    
    func move() {
        print("move")
    }
}

struct MountainKing: Heroes {
    
    var armor: Float?
    
    var attackPower: Float?
    
    var strength: Float?
    
    var agility: Float?
    
    var intelligence: Float?
    
    var hitPoints: Float?
    
    var mana: Float?
    
    func attack() {
        print("melee attacks")
    }
    
    func ultimate() {
        print("Mass Teleport")
    }
    
    func info() {
        print("\(String(describing: self))")
    }
}
