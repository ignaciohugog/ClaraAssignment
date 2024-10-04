public typealias SearchResult = Result<[SearchItem], SearchError>

public enum SearchError: Error, Sendable {
    case empty
    case noMoreResults
    case fetchInProgress
    case badServerResponse
}
