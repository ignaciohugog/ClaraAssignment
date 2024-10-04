import SwiftUI
import Core
import Factory
import Navigation

protocol ArtistViewModelInterface: ObservableObject {
    func goDetail()
    var state: ArtistDetailItem? { get }
    @MainActor func getDetail()
}

final class ArtistViewModel: ArtistViewModelInterface {
    private var artistId: String
    @Injected(\.router) private var router: FlowState<SearchRoutes>
    @Injected(\.getArtistUseCase) private var getArtistUseCase: GetArtistUseCase

    @Published var state: ArtistDetailItem?

    init(_ artistId: String) {
        self.artistId = artistId
    }

    @MainActor func getDetail() {
        Task {
            switch await getArtistUseCase(artistId) {
            case .success(let artist):
                state = .init(id: artist.id,
                              name: artist.name,
                              description: artist.description,
                              members: artist.members?.map {
                                  .init(id: $0.id,
                                        name: $0.name,
                                        resourceURL: $0.resourceURL)
                              })
            case .failure:
                break
            }
        }
    }

    func goDetail() {
        router.push(.album(""))
    }
}


struct ArtistDetailItem: Identifiable, Hashable {
    var id: Int
    var name: String
    var description: String
    var members: [Member]?

    struct Member: Identifiable, Hashable {
        let id: Int
        let name: String
        let resourceURL: String
    }
}
