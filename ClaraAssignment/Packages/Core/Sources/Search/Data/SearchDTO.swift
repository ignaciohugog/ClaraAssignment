struct SearchDTO: Decodable {
    struct ArtistDTO: Decodable {
        let id: Int
        let title: String
        let thumb: String
    }

    let results: [ArtistDTO]
}
