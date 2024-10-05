import Foundation

struct ArtistDetailItem: Identifiable, Hashable {
    var id: Int
    var name: String
    var description: String
    var members: [Member]?

    struct Member: Identifiable, Hashable {
        let id: Int
        let name: String
    }
}
