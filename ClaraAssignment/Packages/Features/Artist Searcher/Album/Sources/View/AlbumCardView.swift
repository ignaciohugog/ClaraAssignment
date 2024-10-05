import UI
import SwiftUI

struct AlbumCardView: View {
    let album: AlbumItem

    var body: some View {
            HStack(alignment: .center, spacing: 16) {
                RemoteImage(url: album.thumb)
                    .frame(width: 60, height: 60)
                VStack(alignment: .leading, spacing: 4) {
                    Text(album.name)
                        .font(.headline)
                        .foregroundColor(.primary)

                    Text("Year: \(album.year)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Text("Genres: \(album.genres)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("Labels: \(album.labels)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 8)
    }
}
