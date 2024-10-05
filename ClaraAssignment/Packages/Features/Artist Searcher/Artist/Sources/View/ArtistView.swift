import UI
import SwiftUI

struct ArtistView<ViewModel: ArtistViewModelInterface>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        Group {
            switch viewModel.state {
            case .loaded(let artist):
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(artist.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)

                        if !artist.description.isEmpty {
                            Text(artist.description)
                                .font(.body)
                                .foregroundColor(.secondary)
                        } else {
                            Text("Description not available")
                                .italic()
                                .font(.body)
                                .foregroundColor(.secondary)
                        }

                        if let members = artist.members, !members.isEmpty {
                            Text("Members")
                                .font(.headline)
                                .padding(.top, 8)

                            ForEach(members) { member in
                                HStack {
                                    Text(member.name)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                        Button(action: {
                            viewModel.showAlbums()
                        }) {
                            Text("Show Albums")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.top, 16)

                        Spacer()
                    }
                }
                .padding()
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
