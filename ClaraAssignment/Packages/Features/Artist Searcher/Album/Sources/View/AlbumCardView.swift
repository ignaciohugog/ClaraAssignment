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
                        .headlineStyle()

                    Text(album.year)
                        .subheadLineStyle()

                    Text(album.genres)
                        .subheadLineStyle()

                    Text(album.labels)
                        .subheadLineStyle()
                }
            }
            .padding(.vertical, 8)
    }
}
