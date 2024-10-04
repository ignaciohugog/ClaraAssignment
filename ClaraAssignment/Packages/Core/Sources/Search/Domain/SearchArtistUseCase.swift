import Factory

public protocol SearchArtistUseCase {
    func callAsFunction(_ artist: String) async -> SearchResult
}

struct SearchArtists: SearchArtistUseCase {
    @Injected(\.searchRepository) private var repository: SearchRepositoryInterface

    func callAsFunction(_ query: String) async -> SearchResult {
        do {
            let results = try await repository.searchArtists(query).results
            guard !results.isEmpty else { return .failure(.empty) }
            return .success(results.map { dto in
                SearchItem(id: dto.id, title: dto.title, thumb: dto.thumb)
            })
        } catch {
            return .failure(error as? SearchError ?? .badServerResponse)
        }
    }
}



