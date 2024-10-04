struct AlbumFilter {
    var artistId: String
    var year: String = ""
    var genre: String = ""
    var label: String = ""

    var badge: Int {
        [genre, label, year].filter { !$0.isEmpty }.count
    }
}
