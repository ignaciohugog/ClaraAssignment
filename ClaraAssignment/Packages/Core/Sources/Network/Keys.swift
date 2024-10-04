import Foundation

struct Keys {
    static var baseURL: String {
        ProcessInfo.processInfo.arguments.contains("mockServer")
        ? "http://localhost:8080"
        : "https://api.discogs.com/"
    }

    // TODO: Improve it
    struct Url {
        static let search = "\(baseURL)/database/search"
        nonisolated(unsafe) static let artist: (String) -> String = { "\(baseURL)/artists/\($0)"
        }
    }

    struct API {
        static let key = "UVPzKyTjeEroNUhvAzVGmeToNHPLlMXSwCffygEs"
    }
}
