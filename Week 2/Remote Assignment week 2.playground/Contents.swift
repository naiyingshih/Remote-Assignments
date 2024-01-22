//: # Part 1: Object-Oriented Swift
//: ## 1-1.
enum Gender {
    case male
    case female
    case undefined
}

class Animal {
    var gender: Gender
    init(gender: Gender) {
        self.gender = gender
    }
    
    func eat() {
        print("I eat everything!")
    }
}

let animal = Animal(gender: .female)
animal.eat()

//: ## 1-2.
class Elephant: Animal {
    override func eat() {
        print("I eat fruits and small plants!")
    }
}

class Tiger: Animal {
    override func eat() {
        print("I eat meat such as deers!")
    }
}

class Horse: Animal {
    override func eat() {
        print("I eat grass and grains!")
    }
}

let elephant = Elephant(gender: .female)
elephant.eat()

let tiger = Tiger(gender: .male)
tiger.eat()

let horse = Horse(gender: .undefined)
horse.eat()

//: ## 1-3.
class Zoo {
    var weeklyHot: Animal
    init(weeklyHot: Animal) {
        self.weeklyHot = weeklyHot
    }
}

let zoo = Zoo(weeklyHot: Tiger(gender: .female))

zoo.weeklyHot = tiger
zoo.weeklyHot = elephant
zoo.weeklyHot = horse

//: ## 1-4.
/*:
 - instance: is used for defining what a Class, Struct or other data type will look like.
 
    For example: animal is instance for class Animal
 */
 /*
  class Animal {
     //body goes here
  }
 
 let animal = Animal( //properties )
 */

/*:
 - initializer: is used to set up the initial state of the instance. It assigns values to its properties, and ensures that new instances of a type are correctly initialized before they’re used for the first time.
 */
//: ## 1-5.
/*:
 The difference between Struct and Class:
 1. Instances types:
 
    - instances type of structs are value types
    - instances type of classes are reference types
 
 2. Classes have additional capabilities that structures don’t have:
 
     - Inheritance - allowing one class to inherit the properties and methods of another class
     - Type casting - enables you to check the type of an instance, or to treat that instance as a different superclass or subclass from somewhere else in its own class hierarchy
     - Deinitializers - you can deallocate the instances when they’re no longer needed, to free up resources
     - Reference counting - allows multiple references to a class instance. (when a class instance is assigned to a property, constant, or variable, it will make a strong reference to the instance. Strong reference keeps a firm hold on that instance, and doesn’t allow it to be deallocated if that strong reference remains.)
 
 */
//: ## 1-6.
/*:
 The difference between reference type and value type:
 
 1. Data storing and assignment:
 
     - reference type - when you create a new instance and assign it to another variable, both variables refer to the same instance. Changes to one instance are reflected in all references to that instance.
     - value type - When a new instance of a struct is created, it is copied. Changes to one instance do not affect other instances.
 
 2. mutablility:
 
     - reference type - mutable, values can be changed after creation.
     - value type - can be immutable or mutable
 
 */
//: ## 1-7.
/*:
 The difference between instance method and type method:
 
 1. Association:
 
     - instance method associated with instance
     - type method associated with type (class, struct, or enum) itself
 
 2. Operation: 
 
     - instance method operates on a specific instance, and use the "self" keyword to refer to the instance.
     - type method called on the type, not on instances. Indicating type methods by the "static" keyword before the method’s func keyword. Classes can use the "class" keyword instead, to allow subclasses to override the superclass’s implementation of that method.
 
 */
//: ## 1-8.
/*:
 Meaning of self in an instance method and a type method:
 
 - self in an instance method: refer to the instance itself. You use the self property to refer to the current instance within its own instance methods.
     
 - self in a type method: refer to the type itself, not an instance. You can use self to disambiguate between type properties and type method parameters
     
 */
//: # Part 2: Enumerations and Optionals in Swift
//: ## 2-1.
enum Gasoline: String {
    case oil92 = "92"
    case oil95 = "95"
    case oil98 = "98"
    case diesel = "diesel"
    
    var price: Double {
        switch self {
        case .oil92:
            return 29.0
        case .oil95:
            return 30.5
        case .oil98:
            return 32.5
        case .diesel:
            return 27.8
        }
    }
    
    func getPrice() -> Double {
        switch self {
        case .oil92:
            return 29.0
        case .oil95:
            return 30.5
        case .oil98:
            return 32.5
        case .diesel:
            return 27.8
        }
    }
}
let oilPrice: Gasoline = .oil92
let priceFromProperty = oilPrice.price
let priceFromMethod = oilPrice.getPrice()

//access to raw value for Gasoline:
Gasoline.oil92.rawValue
Gasoline.oil95.rawValue

/*:
 Associated values provide a way to attach data of different types to each case, allowing you to model more complex and dynamic situations. Associated values are set when you create a new constant or variable based on one of the enumeration’s cases, and can be different each time you do so.
 */
 //For example:
 enum GasolineWihtAssociatedValue {
     case oil92(String)
     case oil95(String)
     case oil98(String)
     case diesel(String)
 }
 
/*:
 (ps. An enumeration can have raw value or associated value, but not both.
 
 In this case, raw value is set in enum. The raw value for a particular enumeration case is always the same.)

 */
//: ## 2-2.
class Pet {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class People {
    var pet: Pet?
    init(pet: Pet?) {
        self.pet = pet
    }
}

//create People instance:
let petName = Pet(name: "Hagrid")
let Emma = People(pet: petName)
let Steven = People(pet: nil)

//Use guard let to unwrap the pet property and print its name:
func getPetName_guard (person: People) {
    guard let pet = person.pet?.name else {
        print("The person does not have a pet.")
        return
    }
    print("\(pet)")
}

getPetName_guard(person: Emma)

//Use if let to unwrap the pet property and print its name:
func getPetName_if (person: People) {
    if let pet = person.pet?.name {
        print("\(pet)")
    } else {
        print("The person does not have a pet.")
    }
}

getPetName_if(person: Steven)

//: # Part 3. Protocol in Swift
//: ## 3-1. & 3-4.
struct Person {
    var name: String
    var toolMan: ToolMan
    
    init(name: String, toolMan: ToolMan) {
        self.name = name
        self.toolMan = toolMan
    }
}

protocol PoliceMan {
    func arrestCriminals()
}
//: ## 3-2.
extension Person: PoliceMan {
    func arrestCriminals() {
        print("\(name) arrests criminals.")
    }
}

//: ## 3-3.
protocol ToolMan {
    func fixComputer()
}

//: ## 3-5.
struct Engineer: ToolMan {
    func fixComputer() {
        print("Engineer fixes computers.")
    }
}

//: ## 3-6.
let steven = Person(name: "Steven", toolMan: Engineer())
steven.arrestCriminals()
steven.toolMan.fixComputer()

//: # Part 4: Error Handling in Swift
//: ## 4-1.
//represent the error conditions of operating guess number game
enum GuessNumberGameError: Error {
    case wrongNumber
}
class GuessNumberGame {
    var targetNumber = 10
    func guess(number: Int) throws {
        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber
        }
        print("Guess the right number: \(targetNumber)")
    }
}

let guessNumber = GuessNumberGame()
do {
    try guessNumber.guess(number: 20)
} catch GuessNumberGameError.wrongNumber {
    print("Wrong number! Try again!")
}
