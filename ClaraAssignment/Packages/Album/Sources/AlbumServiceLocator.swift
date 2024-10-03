import SwiftUI
import Factory
import Navigation

// TODO: Improve it

@MainActor
public final class AlbumServiceLocator {
    public static func entryView(router: FlowState<SearchRoutes>) -> some View {
        let vm = AlbumViewModel()
        vm.router = router

        return AlbumView(viewModel: vm)
    }
}
