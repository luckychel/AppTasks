import Foundation

// MARK: - Person
public class Person {
    let name: String
    let age: Int
    let isDeveloper: Bool
    
    init(_ name: String, _ age: Int, _ isDeveloper: Bool) {
        self.name = name
        self.age = age
        self.isDeveloper = isDeveloper
    }
}
