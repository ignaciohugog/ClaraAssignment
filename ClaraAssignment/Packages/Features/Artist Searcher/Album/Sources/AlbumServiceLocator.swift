import SwiftUI

public final class AlbumServiceLocator {
    public static func mainView(_ artistId: String) -> some View {
        AlbumView(viewModel: AlbumViewModel(artistId))
    }
}
