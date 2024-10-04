import UI
import SwiftUI

struct AlbumView<ViewModel: AlbumViewModelInterface>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        Group {
            switch viewModel.state {
            case .loaded(let items):
                List {
                    ForEach(items) { item in
                        Text(item.name)
                    }
                }
            case .info(let model):
                EmptyContentView(model: model)
            case .loading:
                ProgressView()
            }
        }
        .onAppear() {
            if case .loading = viewModel.state {
                viewModel.onAppear()
            }
        }
    }
}
