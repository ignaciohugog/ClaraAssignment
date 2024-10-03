import SwiftUI

struct ArtistView<ViewModel: ArtistViewModelInterface>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        Button("Go Detail") {
            viewModel.goDetail()
        }
    }
}
