//
//  HomeViewController.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 17.01.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var collection: UICollectionView!
    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(UINib(nibName: "HomeVerticalCell", bundle: nil), forCellWithReuseIdentifier: "HomeVerticalCell")
        collection.register(UINib(nibName: "HomeHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeader")
        viewModelConfiguation()
    }
    
    fileprivate func viewModelConfiguation() {
        viewModel.coordinator = HomeCoordinator(navigationController: navigationController ?? UINavigationController())
        viewModel.getAllGameItems()
        viewModel.errorCallBack = { [weak self] errorMessage in
            print("ERROR: \(errorMessage)")
        }
        viewModel.successCallBack = { [weak self] in
            self?.collection.reloadData()
        }
        
        viewModel.coordinator?.filterGame = { [weak self] category in
            self?.viewModel.gameCategory = category
            self?.viewModel.getCategoryItems()
        }
    }
    
    
    @IBAction func filterButtonClicked(_ sender: Any) {
        viewModel.coordinator?.filterGames()
        self.collection.reloadData()
        }
        
        
//        print("clicked")
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let destinationVC = storyboard.instantiateViewController(withIdentifier: "FilterViewController")
//        destinationVC.modalTransitionStyle = .flipHorizontal
//        present(destinationVC, animated: true,completion: nil)
        }
    
//MARK: -UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
}
//MARK: -UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.game?.results?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeVerticalCell", for: indexPath) as! HomeVerticalCell
        print(viewModel.game?.results?[indexPath.item].gameTitleText ?? "")
        if let game = viewModel.game?.results?[indexPath.item] {
            cell.configure(data: game)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width * 327 / 275, height: 120)
    }
}
//MARK: -UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header: HomeHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeader", for: indexPath) as! HomeHeader
        if let results = viewModel.game?.results {
            header.configure(data: results)
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 365)
    }
    

    
}
