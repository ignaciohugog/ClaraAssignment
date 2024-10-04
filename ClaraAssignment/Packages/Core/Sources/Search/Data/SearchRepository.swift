import Foundation
import Factory

protocol SearchRepositoryInterface {
    func searchArtists(_ query: String) async throws -> SearchDTO
    func searchAlbums(_ filter: FilterDTO) async throws -> SearchDTO
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

    func searchAlbums(_ filter: FilterDTO) async throws -> SearchDTO {
        try await networkDataSource.request(
            Keys.Url.search,
            parameters: [
                "token": Keys.API.key,
                "type": "release",
                "artist_id": filter.artistId,
                "year": filter.year,
                "genre": filter.genre,
                "label": filter.label
            ])
    }
}

