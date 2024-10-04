import UI
import Core
import SwiftUI
import Factory
import Navigation

protocol AlbumViewModelInterface: ObservableObject {
    var state: ViewState<[AlbumItem]> { get }

    @MainActor func onAppear()
}

final class AlbumViewModel: AlbumViewModelInterface {
    private var artistId: String
    @Published var state: ViewState<[AlbumItem]> = .loading
    @Injected(\.router) private var router: FlowState<SearchRoutes>
    @Injected(\.searchAlbumsUseCase) private var searchUseCase: SearchAlbumsUseCase

    init(_ artistId: String) {
        self.artistId = artistId
    }

    @MainActor func onAppear() {
        Task {
            switch await searchUseCase(artistId) {
            case .success(let results):
                state = .loaded(results.map(mapToItem))
            case .failure(let error):
                switch error {
                case .badServerResponse:
                    state = .info(EmptyModel.error)
                case .empty:
                    state = .info(EmptyModel.empty)
                }
            }
        }
    }

    private func mapToItem(_ searchItem: SearchItem) -> AlbumItem {
        .init(id: searchItem.id, name: searchItem.title)
    }
}
