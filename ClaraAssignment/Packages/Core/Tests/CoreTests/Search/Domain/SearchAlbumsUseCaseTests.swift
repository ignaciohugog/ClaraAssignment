import Testing
import Factory
@testable import Core

@Suite(.serialized)
final class SearchAlbumsUseCaseTests {

    private var sut: SearchAlbums!
    private var searchRepository: SearchRepositoryMock!

    // MARK: - Setup

    init() {
        searchRepository = SearchRepositoryMock()
        Container.shared.searchRepository.register { self.searchRepository }
        sut = SearchAlbums()
    }

    deinit {
        sut = nil
        searchRepository = nil        
    }

    // MARK: - Tests

    @Test func testSearchByArtist() async {

        givenSuccess()

        let result = await whenSearch()

        thenExpectSuccessResult(result)
    }

    // MARK: - Given

    func givenSuccess() {
        searchRepository.response = SearchDTO(
            results: [
                .init(id: 1, title: "", thumb: "", year: "", genre: [], label: [])
            ],
            pagination: .init(pages: 1)
        )
    }

    // MARK: When

    private func whenSearch() async -> SearchResult {
        await sut(.init(id: "1", year: "", genre: "", label: ""))
    }

    // MARK: Then

    private func thenExpectSuccessResult(_ result: SearchResult) {
        switch result {
        case .success(let albums):
            #expect(albums.count == 1)
            #expect(albums.first?.id == 1)
        case .failure:
            Issue.record("Expected success, but got failure")
        }
    }
}
