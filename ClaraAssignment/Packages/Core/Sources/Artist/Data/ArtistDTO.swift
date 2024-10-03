struct ArtistDTO: Decodable {
    let name: String
    let id: Int
    let profile: String
    let namevariations: [String]
    let members: [Member]
    let images: [Image]

    struct Image: Codable {
        let type, uri, resourceURL, uri150: String
        let width, height: Int

        enum CodingKeys: String, CodingKey {
            case type, uri
            case resourceURL = "resource_url"
            case uri150, width, height
        }
    }

    struct Member: Codable {
        let id: Int
        let name: String
        let resourceURL: String
        let active: Bool

        enum CodingKeys: String, CodingKey {
            case id, name
            case resourceURL = "resource_url"
            case active
        }
    }

}