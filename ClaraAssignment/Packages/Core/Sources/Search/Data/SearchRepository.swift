import Foundation
import Factory

protocol SearchRepositoryInterface {
    func search(_ artist: String) async throws -> SearchDTO
}

struct SearchRepository: SearchRepositoryInterface {
    @Injected(\.networkService) private var networkDataSource: NetworkDataSource

    func search(_ artist: String) async throws -> SearchDTO {
        try await networkDataSource.request(
            Keys.Url.search,
            parameters: [
                "token": Keys.API.key,
                "artist": artist
            ])
    }
}

