import Foundation

// MARK: - Person2Json
public struct Person2Json: Codable {
    let result: [Person2JsonData]
}

// MARK: - Person2JsonData
public struct Person2JsonData: Codable {
    let name: String
    let age: Int
    let isDeveloper: Bool
}
