//
//  SearchViewModel.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 21.01.2023.
//

import Foundation

class SearchViewModel {
    var item: Game?
    var gameItems = [GameResult]()
    var text = ""
    var successCallBack: (()->())?
    var errorCallBack: ((String)->())?
    
    func getItems() {
        SearchManager.shared.getSearchItems(text: text) { [weak self] game, error in
            if let error = error {
                self?.errorCallBack?(error.localizedDescription)
            } else {
                self?.item = game
                if let gameItems = game?.results, !gameItems.isEmpty {
                    self?.gameItems.append(contentsOf: gameItems)
                }
                self?.successCallBack?()
            }
        }
    }
    
    func search(text: String) {
        deleteAllDatas()
        self.text = text
        getItems()
    }
    
    func deleteAllDatas() {
        text = ""
        item = nil
        gameItems.removeAll()
    }
}
