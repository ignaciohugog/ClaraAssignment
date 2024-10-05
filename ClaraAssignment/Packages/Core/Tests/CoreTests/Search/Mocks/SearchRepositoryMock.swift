@testable import Core

class SearchRepositoryMock: SearchRepositoryInterface {
    var response: SearchDTO!
    func search(_ search: any Core.Searchable, page: Int) async throws -> SearchDTO {
        response
    }
}
