import Testing
import Factory
@testable import Core

@Suite(.serialized)
final class SearchArtistUseCaseTests {

    private var sut: SearchArtist!
    private var searchRepository: SearchRepositoryMock!

    // MARK: - Setup

    init() {
        searchRepository = SearchRepositoryMock()
        Container.shared.searchRepository.register { self.searchRepository }
        sut = SearchArtist()
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
        await sut("")
    }

    // MARK: Then

    private func thenExpectSuccessResult(_ result: SearchResult) {
        switch result {
        case .success(let artists):
            #expect(artists.count == 1)
            #expect(artists.first?.id == 1)
        case .failure:
            Issue.record("Expected success, but got failure")
        }
    }
}
