//
//  FavoriteViewController.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 17.01.2023.
//

import UIKit

class FavoriteViewController: UIViewController, FavoriteManagerObserver {
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(UINib(nibName: "HomeVerticalCell", bundle: nil), forCellWithReuseIdentifier: "HomeVerticalCell")
        FavoriteManager.shared.setDelegate(self)
    }
    
    func itemChanged(items: [GameResult]) {
    }
}


//MARK: -UICollectionViewDataSource
extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeVerticalCell", for: indexPath) as! HomeVerticalCell
        return cell
    }
    
}

//MARK: -UICollectionViewDelegate
extension FavoriteViewController: UICollectionViewDelegate {

}

//MARK: -UICollectionViewDelegateFlowLayout
extension FavoriteViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 32, height: 120)
    }
    

}

