//
//  SearchHelper.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 21.01.2023.
//

import Foundation

//Here is the full address for search without any letter
//https://api.rawg.io/api/games?games=&key=2bc9a39de38844e0afee58925b2a3480&search=


enum SearchEndpoint: String {
    case search = "&search="
    
    var path: String {
        switch self {
        case .search:
            return InternetHelper.shared.requestUrl(url: SearchEndpoint.search.rawValue)
        }
    }
}
