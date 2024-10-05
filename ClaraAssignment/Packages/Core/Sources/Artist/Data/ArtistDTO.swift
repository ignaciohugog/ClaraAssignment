struct ArtistDTO: Decodable {
    let id: Int
    let name: String
    let profile: String
    let members: [Member]?

    struct Member: Decodable {
        let id: Int
        let name: String

        enum CodingKeys: String, CodingKey {
            case id, name
        }
    }
}
