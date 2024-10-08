import UI
import Core
import SwiftUI
import Factory
import SearcherRoutes

protocol ArtistViewModelInterface: ObservableObject {
    var state: ViewState<ArtistDetailItem> { get }

    func showAlbums()
    @MainActor func onAppear()
}

final class ArtistViewModel: ArtistViewModelInterface {
    private var artistId: String
    @Published var state: ViewState<ArtistDetailItem> = .loading
    @Injected(\.searcherRoute) private var router: SearcherRoute
    @Injected(\.getArtistUseCase) private var getArtistUseCase: GetArtistUseCase

    init(_ artistId: String) {
        self.artistId = artistId
    }

    @MainActor func onAppear() {
        Task {
            switch await getArtistUseCase(artistId) {
            case .success(let artist):
                state = .loaded(mapToItem(artist))
            case .failure:
                state = .info(EmptyModel.error)
            }
        }
    }

    func showAlbums() {
        router.push(.album(artistId))
    }
}

extension ArtistViewModel {
    private func mapToItem(_ artist: ArtistDetail) -> ArtistDetailItem {
        .init(id: artist.id,
              name: artist.name,
              description: artist.description,
              members: artist.members?.map {
            .init(id: $0.id, name: $0.name)
        })
    }
}
