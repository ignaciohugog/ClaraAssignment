public struct ArtistDetail: Sendable {
    public let id: Int
    public let name: String
    public let description: String
    public let members: [Member]

    public struct Member: Sendable {
        let id: Int
        let name: String
        let resourceURL: String
    }
}