//
//  SearchViewController.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 17.01.2023.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTexField: UITextField!
    @IBOutlet weak var collection: UICollectionView!
    
    let viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.register(UINib(nibName: "HomeVerticalCell", bundle: nil), forCellWithReuseIdentifier: "HomeVerticalCell")
        configureViewModel()
    }
    
    fileprivate func configureViewModel() {
        viewModel.errorCallBack = { [weak self] errorMessage in
            print("ERROR: \(errorMessage)")
        }
        viewModel.successCallBack = { [weak self] in
            self?.collection.reloadData()
            
        }
    }
    @IBAction func searchTextFieldAction(_ sender: Any) {
        if !(searchTexField.text?.isEmpty ?? false) {
            viewModel.search(text: searchTexField.text ?? "")
            collection.reloadData()
        }
    }
}

//MARK: - UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.gameItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeVerticalCell", for: indexPath) as! HomeVerticalCell
        cell.configure(data: viewModel.gameItems[indexPath.item])
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension SearchViewController: UICollectionViewDelegate {
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width * 327 / 275, height: 120)
    }
    
}

//MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty ?? false {
            viewModel.deleteAllDatas()
            collection.reloadData()
        }
        textField.resignFirstResponder()
        return true
    }
}













