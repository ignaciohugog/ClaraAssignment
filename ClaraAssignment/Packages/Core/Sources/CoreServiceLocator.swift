import Factory

extension Container {
    var networkService: Factory<NetworkDataSource> {
        Factory(self) { NetworkDataSource() }
    }

    var searchRepository: Factory<SearchRepositoryInterface> {
        Factory(self) { SearchRepository() }
    }

    var artistRepository: Factory<ArtistRepositoryInterface> {
        Factory(self) { ArtistRepository() }
    }

    public var searchUseCase: Factory<SearchUseCase> {
        Factory(self) { Search() }
    }

    public var getArtistUseCase: Factory<GetArtistUseCase> {
        Factory(self) { GetArtist() }
    }
}
