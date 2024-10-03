import SwiftUI
import Kingfisher

struct SearcherView<ViewModel: SearcherViewModelInterface>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .loaded(let items):
                    List {
                        ForEach(items) { item in
                            Text(item.name)
                        }
                    }
                case .empty(let model):
                    EmptyContentView(model: model)
                }
            }
        }.searchable(
            text: $viewModel.searchQuery,
            placement: .automatic,
            prompt: "Artist name"
        )
        .textInputAutocapitalization(.never)
        .onSubmit(of: .search) {
            viewModel.onSubmit()
        }.onChange(of: viewModel.searchQuery) {
            if $0.isEmpty {
                viewModel.clearSearch()
            }
        }
    }
}
