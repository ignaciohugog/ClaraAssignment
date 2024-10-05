import SwiftUI

public enum SearchRoutes: Hashable, Identifiable {
    case artist(String)
    case album(String)

    public var id: String {
        String(describing: self)
    }
}


public protocol SearcherRoute {
    func push(_ route: SearchRoutes)
}

public final class SearcherFlowState: ObservableObject, SearcherRoute {
    @Published public var path = NavigationPath()

    public init() {}

    public func push(_ route: SearchRoutes) {
        path.append(route)
    }
}

import Factory

extension Container {
    public var searcherRoute: Factory<SearcherRoute> {
        Factory(self) { SearcherFlowState() }.singleton
    }
}
