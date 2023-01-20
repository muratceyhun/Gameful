//
//  HomeManager.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 20.01.2023.
//

import Foundation

protocol HomeManagerProtocol {
    func getAllGames(complete: @escaping((Game?,Error?)->()))
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
}





