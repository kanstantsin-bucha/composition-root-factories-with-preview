// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeStreaming

struct AnimeData: Decodable {
    let pagination: AnimePagination
    let list: [AnimeListItem]
    
    enum CodingKeys: String, CodingKey {
        case pagination
        case list = "data"
    }
}

struct AnimePagination: Decodable {
    let lastVisiblePage: Int
    let hasNextPage: Bool
    let currentPage: Int
    let items: Items
    
    enum CodingKeys: String, CodingKey {
        case lastVisiblePage = "last_visible_page"
        case hasNextPage = "has_next_page"
        case currentPage = "current_page"
        case items
    }
    
    struct Items: Decodable {
        let count: Int
        let total: Int
        let perPage: Int
        
        enum CodingKeys: String, CodingKey {
            case count
            case total
            case perPage = "per_page"
        }
    }
}

