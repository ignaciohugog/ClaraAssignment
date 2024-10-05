import SwiftUI

public final class ArtistServiceLocator {
    public static func mainView(_ artistId: String) -> some View {
        ArtistView(viewModel: ArtistViewModel(artistId))
    }
}
