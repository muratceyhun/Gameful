//
//  HomeCoordinator.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 21.01.2023.
//

import Foundation
import UIKit


class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var filterGame: ((HomeEndPoint)->())?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func filterGames() {
        let destinationVC = FilterViewController.instantiate(name: .main)
//        navigationController.present(destinationVC, animated: true)
        destinationVC.filterCallBack = { [weak self] categoryResult in
            self?.filterGame?(categoryResult)
        }
        navigationController.presentPanModal(destinationVC)

    }
}
