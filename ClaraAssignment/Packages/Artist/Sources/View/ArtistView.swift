import SwiftUI

struct ArtistView<ViewModel: ArtistViewModelInterface>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            if viewModel.state == nil {
                ProgressView()
            } else {
                Text(viewModel.state!.name)
                    .font(.title)
                    .padding()

                Text(viewModel.state!.description)
                    .font(.body)
                    .padding()

                if let members = viewModel.state!.members {
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
                    viewModel.goDetail()
                }
            }
        }.onAppear() {
            if viewModel.state == nil {
                viewModel.getDetail()
            }
        }
    }
}
