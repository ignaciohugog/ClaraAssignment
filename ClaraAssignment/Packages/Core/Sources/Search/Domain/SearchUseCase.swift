import Factory

class SearchUseCase<Query: Searchable> {
    @Injected(\.searchRepository) private var repository: SearchRepositoryInterface
    private var paginationState = PaginationState<Query>()
    private var isFetching = false
    
    func callAsFunction(_ query: any Searchable) async -> SearchResult {
        paginationState.resetIfNeeded(for: query as! Query)
        guard paginationState.hasMorePages else { return .failure(.noMoreResults) }
        guard !isFetching else { return .failure(.fetchInProgress) }
        isFetching = true
        defer {
            isFetching = false
        }
        do {
            let response = try await repository.search(query, page: paginationState.nextPage)
            paginationState.update(with: response.pagination)
            guard !response.results.isEmpty else { return .failure(.empty) }
            return .success(mapToDomain(response))
        } catch {
            return .failure(error as? SearchError ?? .badServerResponse)
        }
    }

    private func mapToDomain(_ searchDTO: SearchDTO) -> [SearchItem] {
        searchDTO.results.map { dto in
            SearchItem(id: dto.id, title: dto.title, thumb: dto.thumb)
        }
    }
}

final class PaginationState<Query: Equatable> {
    var currentQuery: Query?
    var nextPage: Int = 1
    var totalPages: Int = 1

    var hasMorePages: Bool {
        return nextPage <= totalPages
    }

    func resetIfNeeded(for query: Query) {
        guard currentQuery != query else { return }
        currentQuery = query
        nextPage = 1
        totalPages = 1
    }

    func update(with response: SearchDTO.PaginationDTO) {
        nextPage += 1
        totalPages = response.pages
    }
}
