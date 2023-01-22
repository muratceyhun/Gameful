//
//  HomeManager.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 20.01.2023.
//

import Foundation

protocol HomeManagerProtocol {
    func getAllGames(complete: @escaping((Game?, Error?)->()))
    func getCategoryGames(category:HomeEndPoint, complete: @escaping((Game?, Error?)->()))
}

class HomeManager: HomeManagerProtocol {
    static let shared = HomeManager()
    
    func getAllGames(complete: @escaping ((Game?, Error?) -> ())) {
        InternetManager.shared.request(type: Game.self,
                                       url: HomeEndPoint.all.path,
                                       method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
                print(data)
            case .failure(let error):
                complete(nil, error)
            }
        }
    }
    
    func getCategoryGames(category:HomeEndPoint, complete: @escaping ((Game?, Error?) -> ())) {
        var url = ""
        switch category {
        case .all:
            url = HomeEndPoint.all.path
        case .genres:
            url = HomeEndPoint.genres.path
        case .popularity:
            url = HomeEndPoint.popularity.path
        case .averageRating:
            url = HomeEndPoint.averageRating.path
        case .releaseDate:
            url = HomeEndPoint.releaseDate.path
        }
        InternetManager.shared.request(type: Game.self,
                                       url: url,
                                       method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
                print(data)
            case .failure(let error):
                complete(nil, error)
            }
        }
    }
}





