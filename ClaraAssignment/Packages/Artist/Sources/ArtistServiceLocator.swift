import SwiftUI
import Factory
import Navigation

// TODO: Improve it

@MainActor
public final class ArtistServiceLocator {
    public static func entryView(router: FlowState<SearchRoutes>) -> some View {
        let vm = ArtistViewModel()
        vm.router = router

        return ArtistView(viewModel: vm)
    }
}
