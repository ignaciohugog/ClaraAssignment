import SwiftUI
import Searcher
import Navigation
import Artist
import Album
import Factory

@main
struct ClaraAssignmentApp: App {
    var state = FlowState<SearchRoutes>()

    var body: some Scene {
        WindowGroup {
            appView()
        }
    }
}

@MainActor func appView() -> some View {
    let state = Container.shared.router.resolve()
    let view = SearcherServiceLocator.entryView()

    return AppCoordinator(state: state) {
        view        
    }
}


struct AppCoordinator<Content: View>: View {
    @ObservedObject var state: FlowState<SearchRoutes>
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
