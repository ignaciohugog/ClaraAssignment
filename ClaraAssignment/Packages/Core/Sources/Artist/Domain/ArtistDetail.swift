public struct ArtistDetail: Sendable {
    public let id: Int
    public let name: String
    public let description: String
    public let members: [Member]?

    public struct Member: Sendable {
        public let id: Int
        public let name: String
    }

    public init(id: Int, name: String, description: String, members: [Member]?) {
        self.id = id
        self.name = name
        self.description = description
        self.members = members
    }

}
