import Factory

extension Container {
    var networkService: Factory<NetworkDataSource> {
        Factory(self) { NetworkDataSource() }
    }

    var searchRepository: Factory<SearchRepositoryInterface> {
        Factory(self) { SearchRepository() }
    }
}
