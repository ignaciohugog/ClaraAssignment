import SwiftUI
import Factory
import Navigation

// TODO: Improve it

@MainActor
public final class SearcherServiceLocator {
    public static func entryView(router: FlowState<SearchRoutes>) -> some View {
        let vm = SearcherViewModel()
        vm.router = router
        
        return SearcherView(viewModel: vm)
    }
}
