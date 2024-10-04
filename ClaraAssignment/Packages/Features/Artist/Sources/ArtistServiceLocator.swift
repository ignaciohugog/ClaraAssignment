import SwiftUI
import Factory
import Navigation

// TODO: Improve it

@MainActor
public final class ArtistServiceLocator {
    public static func entryView(_ artistId: String) -> some View {
        ArtistView(viewModel: ArtistViewModel(artistId))
    }
}
