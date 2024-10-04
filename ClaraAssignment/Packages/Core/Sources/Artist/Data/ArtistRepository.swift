import Foundation
import Factory

protocol ArtistRepositoryInterface {
    func get(_ artist: String) async throws -> ArtistDTO
}

struct ArtistRepository: ArtistRepositoryInterface {
    @Injected(\.networkService) private var networkDataSource: NetworkDataSource

    func get(_ artistId: String) async throws -> ArtistDTO {
        try await networkDataSource.request(Keys.Url.artist(artistId))
    }
}


