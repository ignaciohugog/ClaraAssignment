import Testing
import Foundation
import Core
import Factory
@testable import Artist

@Suite(.serialized)
final class ArtistViewModelTests {

    private var sut: ArtistViewModel!
    private var getArtistUseCaseMock: GetArtistUseCaseMock!

    // MARK: - Setup

    init() {
        getArtistUseCaseMock = GetArtistUseCaseMock()
        Container.shared.getArtistUseCase.register { self.getArtistUseCaseMock }
        sut = ArtistViewModel("")
    }

    deinit {
        sut = nil
        getArtistUseCaseMock = nil
    }

    // MARK: - Tests

    @MainActor @Test func testSubmitWhenSuccessThenStateIsLoaded() async {
        givenSuccess()

        sut.onAppear()

        await thenExpectLoaded()
    }

    @MainActor @Test func testSubmitWhenFailThenStateIsInfo() async {
        givenEmptyResponse()

        sut.onAppear()

        await thenExpectInfo()
    }

    // MARK: - Given

    func givenSuccess() {
        let mock: ArtistDetail = ArtistDetail(id: 0, name: "", description: "", members: [])
        getArtistUseCaseMock.response = .success(mock)
    }

    func givenEmptyResponse() {
        getArtistUseCaseMock.response = .failure(.badServerResponse)
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


