import Factory

extension Container {
    var networkService: Factory<NetworkDataSource> {
        Factory(self) { NetworkDataSource() }
    }

    var searchRepository: Factory<SearchRepositoryInterface> {
        Factory(self) { SearchRepository() }
    }

    public var searchUseCase: Factory<SearchUseCase> {
        Factory(self) { Search() }
    }
}
