import UI
import SwiftUI

struct ArtistView<ViewModel: ArtistViewModelInterface>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        Group {
            switch viewModel.state {
            case .loaded(let artist):
                VStack {
                    Text(artist.name)
                        .font(.title)
                        .padding()

                    Text(artist.description)
                        .font(.body)
                        .padding()

                    if let members = artist.members {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(members) { member in
                                    VStack {
                                        Text(member.name)
                                            .font(.body)
                                            .padding()
                                    }
                                }
                            }
                        }
                    }

                    Button("Albums") {
                        viewModel.showAlbums()
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
