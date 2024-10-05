import UI
import Core
import SwiftUI
import Factory

protocol AlbumViewModelInterface: ObservableObject {
    var state: ViewState<[AlbumItem]> { get }
    var filter: AlbumFilter { get set }

    @MainActor func search()
    @MainActor func onSubmit()
}

final class AlbumViewModel: AlbumViewModelInterface {
    @Published var filter: AlbumFilter
    @Published var state: ViewState<[AlbumItem]> = .loading
    @Injected(\.searchAlbumsUseCase) private var searchUseCase: SearchAlbumsUseCase

    init(_ artistId: String) {
        filter = .init(artistId: artistId)
    }

    @MainActor func search() {
        fetch()
    }

    @MainActor func onSubmit() {
        state = .loading
        fetch(true)
    }
}

private extension AlbumViewModel {
    @MainActor func fetch(_ newSearch: Bool = false) {
        Task {
            switch await searchUseCase(mapFilter(), newSearch) {
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

    private func mapToItem(_ searchItem: SearchItem) -> AlbumItem {
        .init(albumId: searchItem.id,
              name: searchItem.title,
              thumb: URL(string: searchItem.thumb),
              year: "Year: \(searchItem.year ?? "-")",
              genres: "Genre: \(searchItem.genres?.joined(separator: ", ") ?? "-")",
              labels: "Label: \(searchItem.labels?.joined(separator: ", ") ?? "-"))")
    }

    private func mapFilter() -> FilterDTO {
        .init(id: filter.artistId, year: filter.year, genre: filter.genre, label: filter.label)
    }
}
