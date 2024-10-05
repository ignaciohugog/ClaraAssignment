import Foundation

struct MockDataParser {
    static func getData(from file: String) -> Data? {
        guard let url = Bundle.module.url(forResource: file, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return nil
        }

        return data
    }
}
