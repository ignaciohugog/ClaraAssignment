import UI
import SwiftUI

struct AlbumView<ViewModel: AlbumViewModelInterface>: View {
    @ObservedObject var viewModel: ViewModel
    @State private var showingSheet = false

    var body: some View {
        Group {
            switch viewModel.state {
            case .loaded(let items):
                List {
                    ForEach(items) { item in
                        AlbumCardView(album: item)
                            .onAppear {
                                if items.last == item {
                                    viewModel.search()
                                }
                            }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
                .listStyle(PlainListStyle())
                .background(Color(UIColor.systemGroupedBackground))
            case .info(let model):
                EmptyContentView(model: model)
            case .loading:
                ProgressView()
            }
        }
        .onAppear() {
            if case .loading = viewModel.state {
                viewModel.onSubmit()
            }
        }
        .navigationTitle("Albums")
        .toolbar {
            Button(action: {
                showingSheet = true
            }) {
                HStack {
                    Text("Filters")
                    if viewModel.filter.badge > 0 {
                        Text("\(viewModel.filter.badge)")
                            .padding(5)
                            .background(Color.red)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .sheet(isPresented: $showingSheet) {
            AlbumFilterView(filter: $viewModel.filter, action: viewModel.onSubmit)
        }
    }
}



