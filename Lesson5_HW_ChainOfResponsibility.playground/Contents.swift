import UIKit

func data(from file: String) -> Data {
    let path1 = Bundle.main.path(forResource: file, ofType: "json")!
    let url = URL(fileURLWithPath: path1)
    let data = try! Data(contentsOf: url)
    return data
}

let data1 = data(from: "1")
let data2 = data(from: "2")
let data3 = data(from: "3")

let file1Parser = json1FileParser()
let file2Parser = json2FileParser()
let file3Parser = json3FileParser()

let json1Data: JsonData = file1Parser
file1Parser.next = file2Parser
file2Parser.next = file3Parser
file3Parser.next = nil

tryParseData { data in
    if let data = data {
        json1Data.tryParse(data3)
    }
}

func tryParseData(completion: @escaping(JsonData?) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        completion(json1Data)
    }
}
