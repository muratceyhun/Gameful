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
}
