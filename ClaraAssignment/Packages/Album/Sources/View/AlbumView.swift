import SwiftUI

struct AlbumView<ViewModel: AlbumViewModelInterface>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        Text("Album View")
    }
}
