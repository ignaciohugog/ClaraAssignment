import Testing
import Foundation
import Core
import Factory
@testable import Album

@Suite(.serialized)
final class AlbumViewModelTests {

    private var sut: AlbumViewModel!
    private var searchAlbumUseCaseMock: SearchAlbumUseCaseMock!

    // MARK: - Setup

    init() {
        searchAlbumUseCaseMock = SearchAlbumUseCaseMock()
        Container.shared.searchAlbumsUseCase.register { self.searchAlbumUseCaseMock }
        sut = AlbumViewModel("")
    }

    deinit {
        sut = nil
        searchAlbumUseCaseMock = nil
    }

    // MARK: - Tests

    @MainActor @Test func testSubmitWhenSuccessThenStateIsLoaded() async {
        givenSuccess()

        sut.onSubmit()

        await thenExpectLoaded()
    }

    @MainActor @Test func testSubmitWhenFailThenStateIsInfo() async {
        givenEmptyResponse()

        sut.onSubmit()

        await thenExpectInfo()
    }

    // MARK: - Given

    func givenSuccess() {
        searchAlbumUseCaseMock.response = .success([])
    }

    func givenEmptyResponse() {
        searchAlbumUseCaseMock.response = .failure(.empty)
    }

    // MARK: Then

    @MainActor private func thenExpectLoaded() async {
        for try await state in self.sut.$state.values {
            if case .loaded = state { return }
        }
    }

    @MainActor private func thenExpectInfo() async {
        for try await state in self.sut.$state.values {
            if case .info = state { return }
        }
    }
}
