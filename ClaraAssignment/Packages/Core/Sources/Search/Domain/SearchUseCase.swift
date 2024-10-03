import Factory

public enum SearchError: Error, Sendable {
    case badURL
    case badServerResponse
}

public typealias SearchResult = Result<[Artist], SearchError>

// sourcery: AutoMockable
public protocol SearchUseCase {
    func callAsFunction() async -> SearchResult
}

struct Search: SearchUseCase {
    @Injected(\.searchRepository) private var repository: SearchRepositoryInterface

    func callAsFunction() async -> SearchResult {
        do {
            let results = try await repository.search("Nir").results
            return .success(results.map { dto in
                Artist(id: dto.id, title: dto.title, thumb: dto.thumb)
            })
        } catch {
            return .failure(error as? SearchError ?? .badServerResponse)
        }
    }
}


