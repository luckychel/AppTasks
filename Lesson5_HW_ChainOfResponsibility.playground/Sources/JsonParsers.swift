import Foundation

public protocol JsonData {
    var next: JsonData? { get set }
    func tryParse(_ data: Data)
}

public class json1FileParser: JsonData {
    public var next: JsonData?
    public init() {}
    public func tryParse(_ data: Data) {
        guard let json1File = try? JSONDecoder().decode(Person1Json.self, from: data) else {
            self.next?.tryParse(data)
            return
        }
        print("that is json1")
        let data: [Person] = json1File.data.compactMap({Person($0.name, $0.age, $0.isDeveloper)})
        printPerson(data)
    }
}


public class json2FileParser: JsonData {
    public var next: JsonData?
    public init() {}
    public func tryParse(_ data: Data) {
        guard let json2File = try? JSONDecoder().decode(Person2Json.self, from: data) else {
            self.next?.tryParse(data)
            return
        }
        print("that is json2")
        let data: [Person] = json2File.result.compactMap({Person($0.name, $0.age, $0.isDeveloper)})
        printPerson(data)
    }
}


public class json3FileParser: JsonData {
    public var next: JsonData?
    public init() {}
    public func tryParse(_ data: Data) {
        guard let json3File = try? JSONDecoder().decode(Person3Json.self, from: data) else {
            self.next?.tryParse(data)
            return
        }
        print("that is json3")
        let data: [Person] = json3File.compactMap({Person($0.name, $0.age, $0.isDeveloper)})
        printPerson(data)
    }
}

public func printPerson(_ data: [Person]) {
    data.forEach { person in
        print("name: \(person.name), age: \(person.age), isDeveloper: \(person.isDeveloper)")
    }
}


