import Core
@testable import Searcher

final class SearchUseCaseMock: SearchArtistUseCase {
    var response: SearchResult!

    func callAsFunction(_ artist: String, _ newSearch: Bool) async -> SearchResult {
        response
    }
}
