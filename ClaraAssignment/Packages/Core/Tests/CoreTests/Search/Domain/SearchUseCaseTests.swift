import Testing
import Factory
@testable import Core

final class SearchUseCaseTests {

    private var sut: SearchUseCase!

    // MARK: - Setup

    init() {
        sut = Search()
    }

    deinit {
        Container.shared.reset()
        sut = nil
    }

    // MARK: - Tests

    @Test func testSearchByArtist() async {
//        Container.shared.searchRepository.register(factory: <#T##() -> T#>)
        let result = try await sut()
        switch result {
        case .success(let artists):
            print(artists)
            #expect(artists.count == 50)
        case .failure:
            Issue.record("Expected success, but got failure")
        }
    }

    // MARK: - Given

    // MARK: When

    // MARK: Then

}
