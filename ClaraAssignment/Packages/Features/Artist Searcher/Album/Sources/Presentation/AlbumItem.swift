import Foundation

struct AlbumItem: Identifiable, Hashable {
    var id = UUID()
    var albumId: Int
    var name: String
    var thumb: URL?
    var year: String
    var genres: String
    var labels: String
}
