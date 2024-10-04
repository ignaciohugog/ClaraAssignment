public struct FilterDTO {
    var artistId: String
    var year: String
    var genre: String
    var label: String

    public init(id: String, year: String, genre: String, label: String) {
        self.artistId = id
        self.year = year
        self.genre = genre
        self.label = label
    }


}

extension FilterDTO: Searchable {
    var parameters: [String: Any] {
        [
            "type": "release",
            "artist_id": artistId,
            "year": year,
            "genre": genre,
            "label": label
        ]
    }
}

struct QueryDTO {
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

protocol Searchable: Equatable {
    var parameters: [String: Any] { get }
}
