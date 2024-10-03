import Alamofire

final class NetworkDataSource {
    func request<T: Decodable>(_ url: URLConvertible, parameters: Parameters? = nil) async throws -> T {
        try await AF.request(url, parameters: parameters)
            .validate()
            .serializingDecodable(T.self)
            .value
    }
}

