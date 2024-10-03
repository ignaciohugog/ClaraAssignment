import Testing
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
        Container.shared.reset()
    }

    // MARK: - Tests

    // TODO: Fix this test
    
//    @MainActor @Test func testSubmitWhenSuccessThenStateIsLoaded() async {
//        givenSuccess()
//
//        // await task 0.2
//        try? await Task.sleep(nanoseconds: 200_000_000)
//
//        sut.onSubmit()
//
//        thenExpectLoaded()
//    }

    @MainActor @Test func testSubmitWhenEmptyThenStateIsEmpty() async {
        givenEmptyResponse()

        sut.onSubmit()

        thenExpectInfo()
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

    private func thenExpectLoaded() {
        if case .loaded = sut.state { return }
        Issue.record("Expected loaded, but got \(sut.state)")
    }

    private func thenExpectInfo() {
        if case .info = sut.state { return }
        Issue.record("Expected loaded, but got \(sut.state)")
    }
}

class SearchUseCaseMock: SearchUseCase {
    var response: SearchResult!

    func callAsFunction(_ artist: String) async -> SearchResult {
        response
    }
}
