import Factory

extension Container {
    public var searcherRoute: Factory<SearcherRoute> {
        Factory(self) { SearcherFlowState() }.singleton
    }
}
