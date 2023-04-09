import Foundation

// MARK: - Person3Json
public struct Person3JsonData: Codable {
    let name: String
    let age: Int
    let isDeveloper: Bool
}

typealias Person3Json = [Person3JsonData]
