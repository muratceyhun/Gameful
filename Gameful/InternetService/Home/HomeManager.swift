//
//  HomeManager.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 20.01.2023.
//

import Foundation

protocol HomeManagerProtocol {
    func getAllGames(complete: @escaping(()->()))
}

class HomeManager: HomeManagerProtocol {
    static let shared = HomeManager()
    func getAllGames(complete: @escaping (() -> ())) {
        
    }
    
    
}



