import Foundation
import Factory

protocol SearchRepositoryInterface {
    func search(_ search: any Searchable, page: Int) async throws -> SearchDTO
}

struct SearchRepository: SearchRepositoryInterface {
    @Injected(\.networkService) private var networkDataSource: NetworkDataSource

    func search(_ search: any Searchable, page: Int) async throws -> SearchDTO {
        try await networkDataSource.request(
            Keys.Url.search,
            parameters: search.parameters.merging(
                [
                    "token": Keys.API.key,
                    "page": page,
                    "per_page": 30
                ]
            ) { _, new in new })
    }
}
