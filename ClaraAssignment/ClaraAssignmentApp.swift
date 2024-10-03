import SwiftUI
import Searcher

@main
struct ClaraAssignmentApp: App {
    var body: some Scene {
        WindowGroup {
            SearcherServiceLocator.entryView()
        }
    }
}
