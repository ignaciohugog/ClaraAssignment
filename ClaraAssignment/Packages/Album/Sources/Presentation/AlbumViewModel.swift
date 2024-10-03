import SwiftUI
import Core
import Factory
import Navigation

protocol AlbumViewModelInterface: ObservableObject {
}

final class AlbumViewModel: AlbumViewModelInterface {
    var router: FlowState<SearchRoutes>!

}
