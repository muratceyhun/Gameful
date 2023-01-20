//
//  HomeHelper.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 20.01.2023.
//

import Foundation

enum GameCategory {
    case popularity
    case averageRating
    case releaseDate
}


//https://api.rawg.io/api/games?key=2bc9a39de38844e0afee58925b2a3480 (All games without any filter)
//https://api.rawg.io/api/games?key=2bc9a39de38844e0afee58925b2a3480&genre (All genres)
//https://api.rawg.io/api/games?key=2bc9a39de38844e0afee58925b2a3480&popularity (Filter by popularity)
//https://api.rawg.io/api/games?key=2bc9a39de38844e0afee58925b2a3480&averageRating (Filter by averageRating)
//https://api.rawg.io/api/games?key=2bc9a39de38844e0afee58925b2a3480&releaseDate (Filter by releaseDate)


enum HomeEndPoint: String {
    case all = ""
    case genres = "&genre"
    case popularity = "&popularity"
    case averageRating = "&averageRating"
    case releaseDate = "&releaseDate"
    
    var path: String {
        switch self {
        case .all:
            return InternetHelper.shared.requestUrl(url: HomeEndPoint.all.rawValue)
        case .genres:
            return InternetHelper.shared.requestUrl(url: HomeEndPoint.genres.rawValue)
        case .popularity:
            return InternetHelper.shared.requestUrl(url: HomeEndPoint.popularity.rawValue)
        case .averageRating:
            return InternetHelper.shared.requestUrl(url: HomeEndPoint.averageRating.rawValue)
        case .releaseDate:
            return InternetHelper.shared.requestUrl(url: HomeEndPoint.releaseDate.rawValue)
        }
    }
}

