import Testing
import Factory
@testable import Core

final class SearchUseCaseTests {

    private var sut: SearchUseCase!
    private var searchRepository: SearchRepositoryMock!

    // MARK: - Setup

    init() {
        searchRepository = SearchRepositoryMock()
        Container.shared.searchRepository.register { self.searchRepository }
        sut = Search()
    }

    deinit {
        sut = nil
        searchRepository = nil
        Container.shared.reset()
    }

    // MARK: - Tests

    @Test func testSearchByArtist() async {

        givenSuccess()

        let result = await whenSearch()

        thenExpectSuccessResult(result)
    }

    // MARK: - Given

    func givenSuccess() {
        searchRepository.response = SearchDTO(results: [])
    }

    // MARK: When

    private func whenSearch() async -> SearchResult {
        await sut("Nirvana")
    }

    // MARK: Then

    private func thenExpectSuccessResult(_ result: SearchResult) {
        switch result {
        case .success(let artists):
            print(artists)
            #expect(artists.count == 0)
        case .failure:
            Issue.record("Expected success, but got failure")
        }
    }
}
