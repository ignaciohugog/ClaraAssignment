struct SearchDTO: Decodable {
    let results: [ItemDTO]
    let pagination: PaginationDTO

    struct ItemDTO: Decodable {
        let id: Int
        let title: String
        let thumb: String
        let year: String?
        let genre: [String]?
        let label: [String]?
    }

    struct PaginationDTO: Decodable {
        let pages: Int
    }
}
