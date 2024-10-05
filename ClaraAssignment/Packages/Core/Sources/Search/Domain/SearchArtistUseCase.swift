import Factory

public protocol SearchArtistUseCase {
    func callAsFunction(_ artist: String, _ newSearch: Bool) async -> SearchResult
}

final class SearchArtist: SearchUseCase<QueryDTO>, SearchArtistUseCase {
    func callAsFunction(_ artist: String, _ newSearch: Bool = false) async -> SearchResult {
        await super.callAsFunction(QueryDTO(query: artist), newSearch)
    }
}

