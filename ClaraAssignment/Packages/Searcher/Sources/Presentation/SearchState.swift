enum SearchState {
    case loaded([ArtistItem])
    case empty(EmptyModel)
}

extension SearchState {
    static var emptyModel: EmptyModel {
        EmptyModel(title: "No results",
                   systemImage: "magnifyingglass",
                   description: "No results found")
    }

    static var searchModel: EmptyModel {
        EmptyModel(title: "Search for an artist",
                   systemImage: "magnifyingglass",
                   description: "Start typing to search")
    }

    static var errorModel: EmptyModel {
        EmptyModel(title: "Error",
                   systemImage: "exclamationmark.triangle",
                   description: "An error occurred")
    }

}
