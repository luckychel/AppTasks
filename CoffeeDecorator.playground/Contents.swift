import Foundation
import UIKit


protocol Coffee {
    var cost: Double { get }
}

public class SimpleCoffee: Coffee {
    public var cost: Double {
        return 50.0
    }
}

protocol CoffeeDecorator: Coffee {
    
    var base: Coffee { get }
    
    init(base: Coffee)
}

public class Milk: CoffeeDecorator {
    var base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
    
    var cost: Double {
        return base.cost + 20.0
    }
}

public class Whip: CoffeeDecorator {
    var base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
    
    var cost: Double {
        return base.cost + 40.0
    }
}

public class Sugar: CoffeeDecorator {
    var base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
    
    var cost: Double {
        return base.cost + 60.0
    }
}

//MARK: running
let simpleCoffee = SimpleCoffee()
let coffeeWithMilk =  Milk(base: simpleCoffee)
let coffeeWithMilkAndWhip =  Whip(base: coffeeWithMilk)
let coffeeWithMilkAndSugar =  Sugar(base: coffeeWithMilk)
let coffeeWithMilkAndWhipAndSugar =  Sugar(base: coffeeWithMilkAndWhip)

//MARK: printing
print(simpleCoffee.cost)
print(coffeeWithMilk.cost)
print(coffeeWithMilkAndWhip.cost)
print(coffeeWithMilkAndSugar.cost)
print(coffeeWithMilkAndWhipAndSugar.cost)
