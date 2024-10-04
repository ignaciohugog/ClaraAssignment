import Factory

public protocol SearchAlbumsUseCase {
    func callAsFunction(_ filter: FilterDTO) async -> SearchResult
}

final class SearchAlbums: SearchUseCase<FilterDTO>, SearchAlbumsUseCase {
    @Injected(\.searchRepository) private var repository: SearchRepositoryInterface

    func callAsFunction(_ filter: FilterDTO) async -> SearchResult {
        await super.callAsFunction(filter)
    }
}
