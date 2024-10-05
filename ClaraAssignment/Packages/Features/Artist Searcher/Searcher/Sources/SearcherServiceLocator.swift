import SwiftUI

public final class SearcherServiceLocator {
    public static func mainView() -> some View {
        SearcherView(viewModel: SearcherViewModel())
    }
}
