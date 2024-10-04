import UI
import Core
import SwiftUI
import Factory
import Navigation

protocol SearcherViewModelInterface: ObservableObject {
    var state: ViewState<[ArtistItem]> { get }

    func clearSearch()
    func showArtistDetail(_ item: ArtistItem)
    @MainActor func onSubmit(_ query: String)
}

final class SearcherViewModel: SearcherViewModelInterface {
    @Published var state: ViewState<[ArtistItem]> = .info(EmptyModel.search)
    @Injected(\.router) private var router: FlowState<SearchRoutes>
    @Injected(\.searchArtistUseCase) private var searchUseCase: SearchArtistUseCase

    @MainActor func onSubmit(_ query: String) {
        state = .loading
        Task {
            switch await searchUseCase(query) {
            case .success(let artists):
                state = .loaded(artists.map(mapToItem))
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

    func clearSearch() {
        state = .info(EmptyModel.search)
    }

    func showArtistDetail(_ item: ArtistItem) {
        router.push(.artist("\(item.id)"))
    }

    private func mapToItem(_ artist: SearchItem) -> ArtistItem {
        .init(id: artist.id, name: artist.title)
    }
}

