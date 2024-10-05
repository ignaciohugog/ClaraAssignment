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
                        HStack {
                            RemoteImage(url: item.image)
                                .frame(width: 60, height: 60)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            Spacer()
                            Text(item.name)
                        }
                        .onTapGesture {
                            viewModel.showArtistDetail(item)
                        }
                        .onAppear {
                            if items.last == item {
                                viewModel.search(searchQuery)
                            }
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
