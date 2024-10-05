public struct SearchItem: Sendable {
    public let id: Int
    public let title: String
    public let thumb: String
    public let year: String?
    public let genres: [String]?
    public let labels: [String]?
}
