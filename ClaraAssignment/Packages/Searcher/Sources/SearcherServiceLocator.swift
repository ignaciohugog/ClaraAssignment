import SwiftUI
import Factory

public final class SearcherServiceLocator {
    public static func entryView() -> some View {
        SearcherView(viewModel: SearcherViewModel())
    }
}
