//
//  HomeManager.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 20.01.2023.
//

import Foundation

protocol HomeManagerProtocol {
    func getCategoryGames(type: GameCategory, complete: @escaping((Game?, Error?)->()))
}

class HomeManager: HomeManagerProtocol {
    static let shared = HomeManager()
    
    func getCategoryGames(type: GameCategory, complete: @escaping ((Game?, Error?) -> ())) {
    
        var url = ""
        switch type {
        case .all:
            url = HomeEndPoint.name.path
        case .name:
            url = HomeEndPoint.name.path
        case .averageRating:
            url = HomeEndPoint.averageRating.path
        case .releaseDate:
            url = HomeEndPoint.releaseDate.path
        }
        InternetManager.shared.request(type: Game.self,
                                       url: "\(url)",
                                       method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error)
            }
        }
    }
    
}





