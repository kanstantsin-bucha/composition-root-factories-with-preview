// https://docs.api.jikan.moe/#tag/anime/operation/getAnimeStreaming

struct AnimeListItem: Decodable, Identifiable, Hashable {
    let id: Int
    let url: StringURL
    let images: Images
    let trailer: Trailer
    let title: String
    let japaneseTitle: String
    let episodes: Int?
    let status: String
    let score: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case url
        case images
        case trailer
        case title
        case japaneseTitle = "title_japanese"
        case episodes
        case status
        case score
    }
    
    struct Images: Decodable, Hashable {
        let jpg: ImageLinks
        let webp: ImageLinks
        
        struct ImageLinks: Decodable, Hashable {
            let url: StringURL
            let smallUrl: StringURL
            let largeUrl: StringURL
            
            enum CodingKeys: String, CodingKey {
                case url = "image_url"
                case smallUrl = "small_image_url"
                case largeUrl = "large_image_url"
            }
        }
            
    }
    
    struct Trailer: Decodable, Hashable {
        let id: String?
        let url: StringURL?

        enum CodingKeys: String, CodingKey {
            case id = "youtube_id"
            case url
        }
    }
}
