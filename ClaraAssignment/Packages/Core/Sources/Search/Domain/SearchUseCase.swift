import Factory

public enum SearchError: Error, Sendable {
    case empty
    case badServerResponse
}

public typealias SearchResult = Result<[Artist], SearchError>

public protocol SearchUseCase {
    func callAsFunction(_ artist: String) async -> SearchResult
}

struct Search: SearchUseCase {
    @Injected(\.searchRepository) private var repository: SearchRepositoryInterface

    func callAsFunction(_ artist: String) async -> SearchResult {
        do {
            let results = try await repository.search(artist).results
            guard !results.isEmpty else { return .failure(.empty) }
            return .success(results.map { dto in
                Artist(id: dto.id, title: dto.title, thumb: dto.thumb)
            })
        } catch {
            return .failure(error as? SearchError ?? .badServerResponse)
        }
    }
}
