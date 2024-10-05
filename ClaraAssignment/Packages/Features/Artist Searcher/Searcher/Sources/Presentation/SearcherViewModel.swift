import UI
import Core
import SwiftUI
import Factory
import SearcherRoutes

protocol SearcherViewModelInterface: ObservableObject {
    var state: ViewState<[ArtistItem]> { get }

    func clearSearch()
    func showArtistDetail(_ item: ArtistItem)
    @MainActor func onSubmit(_ query: String)
    @MainActor func search(_ query: String)
}

final class SearcherViewModel: SearcherViewModelInterface {
    @Published var state: ViewState<[ArtistItem]> = .info(EmptyModel.search)
    @Injected(\.searcherRoute) private var router: SearcherRoute
    @Injected(\.searchArtistUseCase) private var searchUseCase: SearchArtistUseCase

    @MainActor func search(_ query: String) {
        Task {
            switch await searchUseCase(query) {
            case .success(let results):
                switch state {
                case .loaded(let items):
                    state = .loaded(items + results.map(mapToItem))
                default:
                    state = .loaded(results.map(mapToItem))
                }
            case .failure(let error):
                switch error {
                case .badServerResponse:
                    state = .info(EmptyModel.error)
                case .empty:
                    state = .info(EmptyModel.empty)
                case .noMoreResults, .fetchInProgress:
                    // TODO: Handle no more results
                    break
                }
            }
        }
    }

    @MainActor func onSubmit(_ query: String) {
        state = .loading
        search(query)
    }

    func clearSearch() {
        state = .info(EmptyModel.search)
    }

    func showArtistDetail(_ item: ArtistItem) {
        router.push(.artist("\(item.itemId)"))
    }

    private func mapToItem(_ artist: SearchItem) -> ArtistItem {
        .init(itemId: artist.id, name: artist.title, image: URL(string: artist.thumb))
    }
}
