import Foundation

extension AnimeListItem {
    static var preview: AnimeListItem = {
        try! JSONDecoder().decode(AnimeListItem.self, from: json.data(using: .utf8)!)
    }()
}


private let json = """
{
      "mal_id": 1,
      "url": "https://myanimelist.net/anime/1/Cowboy_Bebop",
      "images": {
        "jpg": {
          "image_url": "https://cdn.myanimelist.net/images/anime/4/19644.jpg",
          "small_image_url": "https://cdn.myanimelist.net/images/anime/4/19644t.jpg",
          "large_image_url": "https://cdn.myanimelist.net/images/anime/4/19644l.jpg"
        },
        "webp": {
          "image_url": "https://cdn.myanimelist.net/images/anime/4/19644.webp",
          "small_image_url": "https://cdn.myanimelist.net/images/anime/4/19644t.webp",
          "large_image_url": "https://cdn.myanimelist.net/images/anime/4/19644l.webp"
        }
      },
      "trailer": {
        "youtube_id": "gY5nDXOtv_o",
        "url": "https://www.youtube.com/watch?v=gY5nDXOtv_o",
        "embed_url": "https://www.youtube.com/embed/gY5nDXOtv_o?enablejsapi=1&wmode=opaque&autoplay=1",
        "images": {
          "image_url": "https://img.youtube.com/vi/gY5nDXOtv_o/default.jpg",
          "small_image_url": "https://img.youtube.com/vi/gY5nDXOtv_o/sddefault.jpg",
          "medium_image_url": "https://img.youtube.com/vi/gY5nDXOtv_o/mqdefault.jpg",
          "large_image_url": "https://img.youtube.com/vi/gY5nDXOtv_o/hqdefault.jpg",
          "maximum_image_url": "https://img.youtube.com/vi/gY5nDXOtv_o/maxresdefault.jpg"
        }
      },
      "approved": true,
      "titles": [
        {
          "type": "Default",
          "title": "Cowboy Bebop"
        },
        {
          "type": "Japanese",
          "title": "カウボーイビバップ"
        },
        {
          "type": "English",
          "title": "Cowboy Bebop"
        }
      ],
      "title": "Cowboy Bebop",
      "title_english": "Cowboy Bebop",
      "title_japanese": "カウボーイビバップ",
      "title_synonyms": [],
      "type": "TV",
      "source": "Original",
      "episodes": 26,
      "status": "Finished Airing",
      "airing": false,
      "aired": {
        "from": "1998-04-03T00:00:00+00:00",
        "to": "1999-04-24T00:00:00+00:00",
        "prop": {
          "from": {
            "day": 3,
            "month": 4,
            "year": 1998
          },
          "to": {
            "day": 24,
            "month": 4,
            "year": 1999
          }
        },
        "string": "Apr 3, 1998 to Apr 24, 1999"
      },
      "duration": "24 min per ep",
      "rating": "R - 17+ (violence & profanity)",
      "score": 8.75,
      "scored_by": 961580,
      "rank": 46,
      "popularity": 43,
      "members": 1859520,
      "favorites": 82165,
      "synopsis": "Crime is timeless...",
      "background": "When Cowboy Bebop ...",
      "season": "spring",
      "year": 1998,
      "broadcast": {
        "day": "Saturdays",
        "time": "01:00",
        "timezone": "Asia/Tokyo",
        "string": "Saturdays at 01:00 (JST)"
      },
      "producers": [
        {
          "mal_id": 23,
          "type": "anime",
          "name": "Bandai Visual",
          "url": "https://myanimelist.net/anime/producer/23/Bandai_Visual"
        }
      ],
      "licensors": [
        {
          "mal_id": 102,
          "type": "anime",
          "name": "Funimation",
          "url": "https://myanimelist.net/anime/producer/102/Funimation"
        }
      ],
      "studios": [
        {
          "mal_id": 14,
          "type": "anime",
          "name": "Sunrise",
          "url": "https://myanimelist.net/anime/producer/14/Sunrise"
        }
      ],
      "genres": [
        {
          "mal_id": 1,
          "type": "anime",
          "name": "Action",
          "url": "https://myanimelist.net/anime/genre/1/Action"
        },
        {
          "mal_id": 46,
          "type": "anime",
          "name": "Award Winning",
          "url": "https://myanimelist.net/anime/genre/46/Award_Winning"
        },
        {
          "mal_id": 24,
          "type": "anime",
          "name": "Sci-Fi",
          "url": "https://myanimelist.net/anime/genre/24/Sci-Fi"
        }
      ],
      "explicit_genres": [],
      "themes": [
        {
          "mal_id": 50,
          "type": "anime",
          "name": "Adult Cast",
          "url": "https://myanimelist.net/anime/genre/50/Adult_Cast"
        },
        {
          "mal_id": 29,
          "type": "anime",
          "name": "Space",
          "url": "https://myanimelist.net/anime/genre/29/Space"
        }
      ],
      "demographics": []
    }
"""
