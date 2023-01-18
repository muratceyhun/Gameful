//
//  HomeHeader.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 18.01.2023.
//

import UIKit

class HomeHeader: UICollectionReusableView {
    
    @IBOutlet private weak var topView: UIView!
    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet private weak var bottomView: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collection.register(UINib(nibName: "HomeHorizontalCell", bundle: nil), forCellWithReuseIdentifier: "HomeHorizontalCell")

    }
    
}


//MARK: -PROTOCOLS

extension HomeHeader: UICollectionViewDelegate {
    
}

extension HomeHeader: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeHorizontalCell", for: indexPath) as! HomeHorizontalCell
        return cell
    }
    
    

}


extension HomeHeader: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 143 / 375
        let height = collectionView.frame.height * 283 / 812
        return CGSize(width: width, height: collectionView.frame.height)
    }
}
