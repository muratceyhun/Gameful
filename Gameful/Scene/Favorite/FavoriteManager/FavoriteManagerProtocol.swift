//
//  FavoriteManagerProtocol.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 23.01.2023.
//

import Foundation

protocol FavoriteManagerProtocol {
    var gameItems: [GameResult] { get }

    func addFavorite(_ item: GameResult)
    func removeFavorite(_ item: GameResult)
    func isFavorite(_ item: GameResult) -> Bool
    func setDelegate(_ delegate: FavoriteManagerObserver)
}

protocol FavoriteManagerObserver {
    func itemChanged(items: [GameResult])
}
