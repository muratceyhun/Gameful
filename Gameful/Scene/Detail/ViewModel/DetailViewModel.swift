//
//  DetailViewModel.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 23.01.2023.
//

import Foundation


final class DetailViewModel: NSObject {
    let gameResult: GameResult
    init(gameResult: GameResult) {
        self.gameResult = gameResult
    }
    
    func setFavorite() {
        if FavoriteManager.shared.isFavorite(gameResult) {
            FavoriteManager.shared.removeFavorite(gameResult)
        } else {
            FavoriteManager.shared.addFavorite(gameResult)
        }
    }
    
    
    func isFavorite() -> Bool {
        let isFavorite = FavoriteManager.shared.isFavorite(gameResult)
        return isFavorite
    }
 
}
