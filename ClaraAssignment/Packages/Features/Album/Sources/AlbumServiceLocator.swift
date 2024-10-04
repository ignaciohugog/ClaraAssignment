import SwiftUI
import Factory
import Navigation

// TODO: Improve it

@MainActor
public final class AlbumServiceLocator {
    public static func entryView(_ artistId: String) -> some View {
        AlbumView(viewModel: AlbumViewModel(artistId))
    }
}
