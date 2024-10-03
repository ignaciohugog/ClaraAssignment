import SwiftUI
import Core
import Factory
import Navigation

protocol ArtistViewModelInterface: ObservableObject {
    func goDetail()
}

final class ArtistViewModel: ArtistViewModelInterface {
    var router: FlowState<SearchRoutes>!

    func goDetail() {
        router.push(.album(""))
    }
}
