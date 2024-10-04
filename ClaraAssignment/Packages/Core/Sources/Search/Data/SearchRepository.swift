import Foundation
import Factory

protocol SearchRepositoryInterface {
    func searchArtists(_ query: String) async throws -> SearchDTO
    func searchAlbums(_ artistId: String) async throws -> SearchDTO
}

struct SearchRepository: SearchRepositoryInterface {
    @Injected(\.networkService) private var networkDataSource: NetworkDataSource

    func searchArtists(_ query: String) async throws -> SearchDTO {
        try await networkDataSource.request(
            Keys.Url.search,
            parameters: [
                "token": Keys.API.key,
                "q": query,
                "type": "artist"
            ])
    }

    func searchAlbums(_ artistId: String) async throws -> SearchDTO {
        try await networkDataSource.request(
            Keys.Url.search,
            parameters: [
                "token": Keys.API.key,
                "artist_id": artistId,
                "type": "release"
            ])
    }
}

