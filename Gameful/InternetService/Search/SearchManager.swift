//
//  SearchManager.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 21.01.2023.
//

import Foundation

protocol SearchManagerProtocol {
    func getSearchItems(text: String, complete: @escaping((Game?, Error?)->()))
}

class SearchManager: SearchManagerProtocol {
    static let shared = SearchManager()
    
    func getSearchItems(text: String, complete: @escaping ((Game?, Error?) -> ())) {
        InternetManager.shared.request(type: Game.self,
                                       url: SearchEndpoint.search.path + "\(text)",
                                       method: .get) { response  in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error)
            }
        }
    }
}
