public enum ViewState<T: Sendable>: Sendable {
    case loaded(T)
    case info(EmptyModel)
    case loading
}

public struct EmptyModel: Sendable {
    public var title: String
    public var systemImage: String
    public var description: String
}

public extension EmptyModel {
    static var empty: EmptyModel {
        EmptyModel(title: "No results",
                   systemImage: "magnifyingglass",
                   description: "No results found")
    }

    static var search: EmptyModel {
        EmptyModel(title: "Search for an artist",
                   systemImage: "magnifyingglass",
                   description: "Start typing to search")
    }

    static var error: EmptyModel {
        EmptyModel(title: "Error",
                   systemImage: "exclamationmark.triangle",
                   description: "An error occurred")
    }

}
