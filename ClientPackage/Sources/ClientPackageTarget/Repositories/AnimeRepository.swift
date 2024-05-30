import Foundation
import OSLogs

class AnimeRepository {
    private let urlSession = URLSession.shared
    
    func getAnime() async throws -> [AnimeListItem] {
        let request = URLRequest(url: Constants.Links.getAnimeLink)
        let (data, response) = try await urlSession.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.invalidStatusCode
        }
        guard !data.isEmpty else {
            throw NetworkError.emptyResponse
        }
        let animeData = try JSONDecoder().decode(AnimeData.self, from: data)
        Logs.repo.log("pagination: \(animeData.pagination)")
        return animeData.list
    }
}

enum NetworkError: Error {
    case invalidStatusCode
    case emptyResponse
}
