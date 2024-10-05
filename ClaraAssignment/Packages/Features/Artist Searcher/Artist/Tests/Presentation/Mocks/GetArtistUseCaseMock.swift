import Core
@testable import Artist

class GetArtistUseCaseMock: GetArtistUseCase {
    var response: ArtistResult!

    func callAsFunction(_ artistId: String) async -> ArtistResult {
        response
    }
}
