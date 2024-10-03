import Foundation

struct Keys {
    static var baseURL: String {
        ProcessInfo.processInfo.arguments.contains("mockServer")
        ? "http://localhost:8080"
        : "https://api.discogs.com/database/"
    }

    struct Url {
        static let search = "\(baseURL)/search"
    }

    struct API {
        static let key = "UVPzKyTjeEroNUhvAzVGmeToNHPLlMXSwCffygEs"
    }
}
