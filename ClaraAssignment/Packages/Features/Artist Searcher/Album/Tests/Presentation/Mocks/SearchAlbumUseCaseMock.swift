import Core
@testable import Album

final class SearchAlbumUseCaseMock: SearchAlbumsUseCase {
    var response: SearchResult!

    func callAsFunction(_ filter: FilterDTO, _ newSearch: Bool) async -> SearchResult {
        response
    }
}
