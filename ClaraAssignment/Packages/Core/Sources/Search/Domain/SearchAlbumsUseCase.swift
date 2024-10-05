import Factory

public protocol SearchAlbumsUseCase {
    func callAsFunction(_ filter: FilterDTO, _ newSearch: Bool) async -> SearchResult
}

final class SearchAlbums: SearchUseCase<FilterDTO>, SearchAlbumsUseCase {
    @Injected(\.searchRepository) private var repository: SearchRepositoryInterface

    func callAsFunction(_ filter: FilterDTO, _ newSearch: Bool = false) async -> SearchResult {
        await super.callAsFunction(filter, newSearch)
    }
}
