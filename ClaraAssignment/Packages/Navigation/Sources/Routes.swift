import SwiftUI
import Foundation

public final class FlowState<T: Hashable & Identifiable>: ObservableObject {
    @Published public var path = NavigationPath()

    public init() {}

    public func push(_ route: T) {
        path.append(route)
    }
}

public enum SearchRoutes: Hashable, Identifiable {
    case artist(String)
    case album(String)

    public var id: String {
        String(describing: self)
    }
}


// TODO: Improve it

import Factory

extension Container {
    public var router: Factory<FlowState<SearchRoutes>> {
        Factory(self) { FlowState<SearchRoutes>() }.singleton
    }
}
