import SwiftUI
import Core
import Factory

protocol SearcherViewModelInterface: ObservableObject {
    var state: SearchState { get }
    var searchQuery: String { get set }
    @MainActor func onSubmit()
    func clearSearch()
}

final class SearcherViewModel: SearcherViewModelInterface {
    @Published var searchQuery: String = ""
    @Published var state: SearchState = .info(SearchState.searchModel)
    @Injected(\.searchUseCase) private var searchUseCase: SearchUseCase

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
}

