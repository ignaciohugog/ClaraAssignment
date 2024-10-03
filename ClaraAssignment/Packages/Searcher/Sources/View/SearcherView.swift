import SwiftUI
import Kingfisher

struct SearcherView<ViewModel: SearcherViewModelInterface>: View {
    @ObservedObject var viewModel: ViewModel

    public var body: some View {
        Text("Hello, world!")
            .padding()
    }
}
