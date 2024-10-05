import Foundation

struct ArtistItem: Identifiable, Hashable {
    var id = UUID()
    var itemId: Int
    var name: String
    var image: URL?
}
