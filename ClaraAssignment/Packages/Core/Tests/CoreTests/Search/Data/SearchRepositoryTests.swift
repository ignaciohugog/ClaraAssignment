import Testing
import Swifter
import Foundation

@testable import Core

final class SearchRepositoryTests {

    private var sut = SearchRepository()
    private let server = HttpServer()

    // MARK: - Setup

    init() {
        ProcessInfo.processInfo.setValue("mockServer", forKey: "arguments")
        try? server.start()
    }

    deinit {
        server.stop()
    }

    // MARK: - Tests

    @Test func testGetItemsWillSuccess() async {
        givenRequestWillSuccess()

        let result = await whenGetItems()

        expectSuccessResult(result)
    }

    // MARK: - Given

    private func givenRequestWillSuccess() {
        let items = MockDataParser.getData(from: "SearchResponse")!
        server["/database/search"] = { _ in .ok(.data(items)) }
    }

    private func givenRequestWillFail() {
        server["/database/search"] = { _ in .internalServerError }
    }

    // MARK: - When

    private func whenGetItems() async -> SearchDTO? {
        try? await sut.search(QueryDTO(query: ""), page: 1)
    }

    // MARK: - Then

    private func expectSuccessResult(_ result: SearchDTO?) {
        #expect(result?.results.count == 30)
        #expect(result?.pagination.pages == 333)
    }

}


