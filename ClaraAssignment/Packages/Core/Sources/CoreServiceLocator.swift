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

    public var searchArtistUseCase: Factory<SearchArtistUseCase> {
        Factory(self) { SearchArtist() }
    }

    public var searchAlbumsUseCase: Factory<SearchAlbumsUseCase> {
        Factory(self) { SearchAlbums() }
    }

    public var getArtistUseCase: Factory<GetArtistUseCase> {
        Factory(self) { GetArtist() }
    }
}
