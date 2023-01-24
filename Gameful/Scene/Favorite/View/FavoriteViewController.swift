//
//  FavoriteViewController.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 17.01.2023.
//

import UIKit

class FavoriteViewController: UIViewController, FavoriteManagerObserver {
   

    override func viewDidLoad() {
        super.viewDidLoad()
        FavoriteManager.shared.setDelegate(self)
    }

    
    func itemChanged(items: [GameResult]) {
        print(items)
    }
}
