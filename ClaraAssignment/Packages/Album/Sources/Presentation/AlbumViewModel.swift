import SwiftUI
import Core
import Factory
import Navigation

protocol AlbumViewModelInterface: ObservableObject {
}

final class AlbumViewModel: AlbumViewModelInterface {
    private var artistId: String
    @Injected(\.router) private var router: FlowState<SearchRoutes>

    init(_ artistId: String) {
        self.artistId = artistId
    }
}
