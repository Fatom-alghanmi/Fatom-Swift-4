import UIKit

/*
 Objective
 Create a base protocol with common properties or methods for monsters.
 Derive two child protocols for specific monster types.
 Create four classes (two flying and two water monsters) conforming to these child protocols.
 Write a function that accepts a collection of Monster objects and prints details about each.
=============================================
//Step 1: Define the Base Protocol
Monster with:
var name: String { get }
func roar() -> String */
protocol Monster {
    var name: String { get }

    func roar() -> String
}
//===================================>>
/*
 Step 2: Define Child Protocols
 FlyingMonster with:
 var wingSpan: Double { get }
 func fly() -> String
 WaterMonster with:
 var swimSpeed: Int { get }
 func swim() -> String

 */
protocol FlyingMonster: Monster {
    var wingSpan: Double { get }
    
    func fly() -> String
}
//=====================================>>

protocol WaterMonster: Monster {
    var swimSpeed: Int { get }
    
    func swim() -> String
}
//=====================================>>
/*
 Step 3: Create Four Classes
 Dragon and Gryphon conforming to FlyingMonster.
 Kraken and Merfolk conforming to WaterMonster.

 */
class Dragon: FlyingMonster { //conforming to FlyingMonster
    var name: String
    var wingSpan: Double
    
    init(name: String, wingSpan: Double ) {
        self.name = name
        self.wingSpan = wingSpan
    }
    func roar() -> String {
        return "\(self.name) unleashes a deafening roar, shaking the mountains!"
    }
    func fly() -> String {
        return "\(self.name) flies high with a wingspan of \(self.wingSpan)-meters."
    }
    
}
//=========================================>>

class Gryphon: FlyingMonster { //conforming to FlyingMonster
    var name: String
    var wingSpan: Double
    
    init(name: String, wingSpan: Double ) {
        self.name = name
        self.wingSpan = wingSpan
        
    }
    func roar() -> String {
        return "\(self.name) lets out a sharp, piercing cry that echoes across the sky!"
    }
    
    func fly() -> String {
        return "\(self.name) beats its powerful wings with a wingspan of \(self.wingSpan)-meters!"
    }
    
}
//========================================>>

class Kraken: WaterMonster { //conforming to WaterMonster
    var name: String
    var swimSpeed: Int
    
    init(name: String, swimSpeed: Int ) {
        self.name = name
        self.swimSpeed = swimSpeed
    }
    func roar() -> String {
        return "\(self.name) bellows from the depths, sending shockwaves through the ocean!"
    }
    
    func swim() -> String {
        return "\(self.name) swims gracefully at speeds of \(self.swimSpeed) knots."
    }
    
}
//=========================================>>
class Merfolk: WaterMonster { //conforming to WaterMonster
    var name: String
    var swimSpeed: Int
    
    init(name: String, swimSpeed: Int) {
        self.name = name
        self.swimSpeed = swimSpeed
    }
    func roar() -> String {
        return "\(self.name) sings a haunting melody, paralyzing anyone who hears it!"
    }
        func swim() -> String {
            return "\(self.name) gracefully glides through the water, her wingspan of \(self.swimSpeed) knots allows her to steer like a graceful bird in flight!"
        }
}
//=======================================>>
/*
 Step 4: Create a Function to Handle Monsters
 printMonsterDetails(monsters: [Monster]) to print information for each monster, using polymorphism to call appropriate methods based on their type.

 */
func printMonsterDetails(monsters: [Monster]) { // colloction of monsters
    for m in monsters {
        print(m.roar())// printing roar func for each monster
        
        if let flyingMonster = m as? FlyingMonster {
            print(flyingMonster.fly() )
        }
        if let waterMonster = m as? WaterMonster {
            print(waterMonster.swim())
            
        }
print("--------------------------")// separate between monsters for clarity
    }
    
}

//testing codes
//========================================>>
let dragon: Dragon = Dragon(name: "Smaug", wingSpan: 15.5)

let gryphon: Gryphon = Gryphon(name: "Gryphara", wingSpan: 17.4)

let kraken: Kraken = Kraken(name: "Leviathan", swimSpeed: 30)

let merfolk: Merfolk = Merfolk(name: "Nerina", swimSpeed: 40)

let monsters: [Monster] = [dragon, gryphon, kraken, merfolk]

printMonsterDetails(monsters: monsters)
