public struct ArtistDetail: Sendable {
    public let id: Int
    public let name: String
    public let description: String
    public let members: [Member]?

    public struct Member: Sendable {
        public let id: Int
        public let name: String
        public let resourceURL: String
    }
}
