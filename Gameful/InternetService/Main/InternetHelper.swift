//
//  InternetHelper.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 16.01.2023.
//

import Foundation

enum ErrorTypes: String, Error {
    case invalidData = "Invalid data!!"
    case invalidURL = "Invalid url!!"
    case generalError = "An error detected!!"
}

class InternetHelper {
    
    // All games url address regardless of category.
    // https://api.rawg.io/api/games?key=2bc9a39de38844e0afee58925b2a3480
    

//https://api.rawg.io/api/games?games=&key=2bc9a39de38844e0afee58925b2a3480&search=
    
    static let shared = InternetHelper()
    private let baseURL = "https://api.rawg.io/api/"
    private let apiKey = "2bc9a39de38844e0afee58925b2a3480"
    private let filterGames = "games?key="
    private let searchGames = "games?games=&key="
    private let filterPlatforms = "platforms?key="
    private let imageBasePath = "https://media.rawg.io/media/games/"
    
    
    
    //Ordering for name
    //https://api.rawg.io/api/games?key=2bc9a39de38844e0afee58925b2a3480&ordering=name
    
    
    func requestUrl(url: String) -> String {
        baseURL + filterGames + apiKey + url
    }
    
    
    func getImagePath(url: String) -> String {
        url
    }
//https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg (An example image url)
}
