import Factory

public protocol SearchAlbumsUseCase {
    func callAsFunction(_ filter: FilterDTO) async -> SearchResult
}

struct SearchAlbums: SearchAlbumsUseCase {
    @Injected(\.searchRepository) private var repository: SearchRepositoryInterface

    func callAsFunction(_ filter: FilterDTO) async -> SearchResult {
        do {
            let results = try await repository.searchAlbums(filter).results
            guard !results.isEmpty else { return .failure(.empty) }
            return .success(results.map { dto in
                SearchItem(id: dto.id, title: dto.title, thumb: dto.thumb)
            })
        } catch {
            return .failure(error as? SearchError ?? .badServerResponse)
        }
    }
}
