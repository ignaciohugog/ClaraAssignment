import Factory

public enum ArtistError: Error, Sendable {
    case badServerResponse
}

public typealias ArtistResult = Result<ArtistDetail, ArtistError>

public protocol GetArtistUseCase {
    func callAsFunction(_ artistId: String) async -> ArtistResult
}

struct GetArtist: GetArtistUseCase {
    @Injected(\.artistRepository) private var repository: ArtistRepositoryInterface

    func callAsFunction(_ artistId: String) async -> ArtistResult {
        do {
            let dto = try await repository.get(artistId)
            return .success(
                ArtistDetail(
                    id: dto.id,
                    name: dto.name,
                    description: dto.profile,
                    members: dto.members?.map { member in
                        ArtistDetail.Member(
                            id: member.id,
                            name: member.name,
                            resourceURL: member.resourceURL ?? ""
                        )
                    }
                )
            )
        } catch {
            return .failure(error as? ArtistError ?? .badServerResponse)
        }
    }
}
