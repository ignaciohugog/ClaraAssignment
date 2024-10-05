import SwiftUI
import Searcher
import Artist
import Album
import Factory
import SearcherRoutes

struct SearcherCoordinator<Content: View>: View {
    @ObservedObject var state: SearcherFlowState
    @ViewBuilder let content: () -> Content

    var body: some View {
        NavigationStack(path: $state.path) {
            content()
                .navigationDestination(for: SearchRoutes.self) { route in
                    switch route {
                    case .artist(let artist):
                        ArtistServiceLocator.entryView(artist)
                    case .album(let artist):
                        AlbumServiceLocator.entryView(artist)
                    }
                }
        }
    }
}

@MainActor public func SearcherCoordinatorView() -> some View {
    let state = Container.shared.searcherRoute.resolve()
    let view = SearcherServiceLocator.entryView()

    return SearcherCoordinator(state: state as! SearcherFlowState) {
        view
    }
}
