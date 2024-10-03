@testable import Core

class SearchRepositoryMock: SearchRepositoryInterface {
    var response: SearchDTO!
    func search(_ artist: String) async throws -> SearchDTO {
        response
    }
}
