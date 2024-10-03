import SwiftUI
import Searcher
import Navigation

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
    let state = FlowState<SearchRoutes>()
    let view = SearcherServiceLocator.entryView(router: state)

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
                    case .detail(let symbol):
                        EmptyView()
                    }
                }
        }
    }
}
