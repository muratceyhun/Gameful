//
//  HomeViewModel.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 20.01.2023.
//

import Foundation

class HomeViewModel {
    let manager = HomeManager.shared
    var game: Game?
    var gameItems = [GameResult]()
    var errorCallBack: ((String)->())?
    var successCallBack: (()->())?
    
    func getAllGameItems() {
        manager.getAllGames { [weak self] game, error in
            if let error = error {
                self?.errorCallBack?(error.localizedDescription)
            } else {
                self?.game = game
                self?.successCallBack?()
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
