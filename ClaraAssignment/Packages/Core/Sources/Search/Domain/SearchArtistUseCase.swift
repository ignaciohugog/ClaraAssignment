import Factory

public protocol SearchArtistUseCase {
    func callAsFunction(_ artist: String) async -> SearchResult
}

final class SearchArtist: SearchUseCase<QueryDTO>, SearchArtistUseCase {
    func callAsFunction(_ artist: String) async -> SearchResult {
        await super.callAsFunction(QueryDTO(query: artist))
    }
}

