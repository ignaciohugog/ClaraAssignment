import Foundation

public struct QueryDTO {
    var query: String

    public init(query: String) {
        self.query = query
    }
}

extension QueryDTO: Searchable {
    var parameters: [String: Any] {
        [
            "q": query,
            "type": "artist"
        ]
    }
}
