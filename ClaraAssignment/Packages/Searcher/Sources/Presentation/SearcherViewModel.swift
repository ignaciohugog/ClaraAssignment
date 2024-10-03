import SwiftUI
import Core
import Factory
import Navigation

protocol SearcherViewModelInterface: ObservableObject {
    var state: SearchState { get }
    var searchQuery: String { get set }
    @MainActor func onSubmit()
    func clearSearch()
    func goDetail(_ item: ArtistItem)
}

final class SearcherViewModel: SearcherViewModelInterface {
    @Published var searchQuery: String = ""
    @Published var state: SearchState = .info(SearchState.searchModel)
    @Injected(\.searchUseCase) private var searchUseCase: SearchUseCase

    var router: FlowState<SearchRoutes>!

    @MainActor func onSubmit() {
        Task {
            switch await searchUseCase(searchQuery) {
            case .success(let artists):
                state = .loaded(artists.map {
                    .init(id: $0.id, name: $0.title)
                })
            case .failure(let error):
                switch error {
                case .badServerResponse:
                    state = .info(SearchState.errorModel)
                case .empty:
                    state = .info(SearchState.emptyModel)
                }

            }
        }
    }

    func clearSearch() {
        state = .info(SearchState.searchModel)
    }

    func goDetail(_ item: ArtistItem) {
//        guard let index = state.loaded.firstIndex(of: item) else { return }
//        let item = items[index]
//        router.push(.detail(item.symbol))
        router.push(.detail(""))
    }
}

