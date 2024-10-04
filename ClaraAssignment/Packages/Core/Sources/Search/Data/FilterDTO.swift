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
