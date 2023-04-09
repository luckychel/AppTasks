import Foundation

// MARK: - Person1Json
public struct Person1Json: Codable {
    let data: [Person1JsonData]
}

// MARK: - Person1JsonData
public struct Person1JsonData: Codable {
    let name: String
    let age: Int
    let isDeveloper: Bool
}
