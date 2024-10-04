import UI
import SwiftUI

struct SearcherView<ViewModel: SearcherViewModelInterface>: View {
    @ObservedObject var viewModel: ViewModel
    @State private var searchQuery: String = ""

    var body: some View {
        Group {
            switch viewModel.state {
            case .loaded(let items):
                List {
                    ForEach(items) { item in
                        Text(item.name)
                            .onTapGesture {
                                viewModel.showArtistDetail(item)
                            }
                    }
                }
            case .info(let model):
                EmptyContentView(model: model)
            case .loading:
                ProgressView()
            }
        }
        .searchable(
            text: $searchQuery,
            placement: .automatic,
            prompt: "Artist name"
        )
        .textInputAutocapitalization(.never)
        .onSubmit(of: .search) {
            viewModel.onSubmit(searchQuery)
        }.onChange(of: searchQuery) {
            if $0.isEmpty {
                viewModel.clearSearch()
            }
        }
    }
}
