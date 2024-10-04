import Testing
import Foundation
import Core
import Factory
@testable import Searcher


final class SearcherViewModelTests {

    private var sut: SearcherViewModel!
    private var searchUseCaseMock: SearchUseCaseMock!

    // MARK: - Setup

    init() {
        searchUseCaseMock = SearchUseCaseMock()
        Container.shared.searchUseCase.register { self.searchUseCaseMock }
        sut = SearcherViewModel()
    }

    deinit {
        sut = nil
        searchUseCaseMock = nil
    }

    // MARK: - Tests

    // TODO: Fix this test


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
        searchUseCaseMock.response = .success([])
    }

    func givenEmptyResponse() {
        searchUseCaseMock.response = .failure(.empty)
    }

    // MARK: When


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

class SearchUseCaseMock: SearchUseCase {
    var response: SearchResult!

    func callAsFunction(_ artist: String) async -> SearchResult {
        response
    }
}
