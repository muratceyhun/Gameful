//
//  HomeViewController.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 17.01.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var collection: UICollectionView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collection.register(UINib(nibName: "HomeVerticalCell", bundle: nil), forCellWithReuseIdentifier: "HomeVerticalCell")
        
        collection.register(UINib(nibName: "HomeHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeader")
        
        

    }
    
    @IBAction func filterButtonClicked(_ sender: Any) {
        print("clicked")
    }
    

}


//MARK: -PROTOCOLS

extension HomeViewController: UICollectionViewDelegate {
    
}


extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeVerticalCell", for: indexPath) as! HomeVerticalCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width * 327 / 275, height: 120)
    }
    
 
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header: HomeHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeader", for: indexPath) as! HomeHeader
        header.backgroundColor = .red
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 365)
    }
    

    
}