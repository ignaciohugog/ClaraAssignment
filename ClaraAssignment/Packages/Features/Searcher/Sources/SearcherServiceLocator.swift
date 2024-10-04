import SwiftUI
import Factory
import Navigation

// TODO: Improve it

@MainActor
public final class SearcherServiceLocator {
    public static func entryView() -> some View {
        SearcherView(viewModel: SearcherViewModel())
    }
}
