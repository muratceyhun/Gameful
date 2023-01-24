//
//  HomeHelper.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 20.01.2023.
//

import Foundation

enum GameCategory {
    case all
    case genres
    case name
    case averageRating
    case releaseDate
}


//https://api.rawg.io/api/games?key=2bc9a39de38844e0afee58925b2a3480 (All games without any filter)
//https://api.rawg.io/api/games?key=2bc9a39de38844e0afee58925b2a3480&genre (All genres)
//https://api.rawg.io/api/games?key=2bc9a39de38844e0afee58925b2a3480&ordering=name (order by name)
//https://api.rawg.io/api/games?key=2bc9a39de38844e0afee58925b2a3480&ordering=rating (order by rating)
//https://api.rawg.io/api/games?key=2bc9a39de38844e0afee58925b2a3480&released (order by releaseDate)


enum HomeEndPoint: String {
    case all = ""
    case genres = "&genre"
    case name = "&ordering=name"
    case averageRating = "&ordering=rating"
    case releaseDate = "&ordering=released"
    
    var path: String {
        switch self {
        case .all:
            return InternetHelper.shared.requestUrl(url: HomeEndPoint.all.rawValue)
        case .genres:
            return InternetHelper.shared.requestUrl(url: HomeEndPoint.genres.rawValue)
        case .name:
            return InternetHelper.shared.requestUrl(url: HomeEndPoint.name.rawValue)
        case .averageRating:
            return InternetHelper.shared.requestUrl(url: HomeEndPoint.averageRating.rawValue)
        case .releaseDate:
            return InternetHelper.shared.requestUrl(url: HomeEndPoint.releaseDate.rawValue)
        }
    }
}

