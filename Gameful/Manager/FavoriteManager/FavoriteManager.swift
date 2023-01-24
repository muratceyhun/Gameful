//
//  FavoriteManager.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 23.01.2023.
//

import Foundation

final class FavoriteManager: FavoriteManagerProtocol {
    
    
    static let shared: FavoriteManagerProtocol = FavoriteManager()
    var delegate: FavoriteManagerObserver?
    var gameItems: [GameResult]
    
    init(){
        gameItems = []
    }
    func addFavorite(_ item: GameResult) {
        gameItems.append(item)
        delegate?.itemChanged(items: gameItems)
    }
    
    func removeFavorite(_ item: GameResult) {
        if let index = gameItems.firstIndex(where: {$0.id == item.id}) {
            gameItems.remove(at: index)
            delegate?.itemChanged(items: gameItems)
        }
    }
    
    func isFavorite(_ item: GameResult) -> Bool {
        if gameItems.isEmpty {
            return false
        }
        return gameItems.contains { gameResult in
            if let gameResultID = gameResult.id, let itemID = item.id {
                if gameResultID == itemID {
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        }
    }
    func setDelegate(_ delegate: FavoriteManagerObserver) {
        self.delegate = delegate
    }
    
}
