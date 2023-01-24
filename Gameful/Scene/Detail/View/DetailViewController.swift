//
//  DetailViewController.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 22.01.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var gameImage: UIImageView!
    @IBOutlet private weak var gameId: UILabel!
    @IBOutlet private weak var gameTitle: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteImage.isUserInteractionEnabled = true
        gameImage.loadURL(url: viewModel?.gameResult.gamePosterImage ?? "")
        gameId.text = String(viewModel?.gameResult.id ?? .zero)
        gameTitle.text = viewModel?.gameResult.gameTitleText
        ratingLabel.text = viewModel?.gameResult.ratingText
        releaseDateLabel.text = viewModel?.gameResult.releaseDateText
        checkFavorite()
        addFav()
    }
    
    private func checkFavorite() {
        if viewModel?.isFavorite() ?? false {
            favoriteImage.image = UIImage(systemName: "star.fill")
        } else {
            favoriteImage.image = UIImage(systemName: "star")
        }
    }
    private func addFav() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(favButtonClicked))
        gesture.numberOfTouchesRequired = 1
        favoriteImage.addGestureRecognizer(gesture)
    }
    
    @objc func favButtonClicked() {
        viewModel?.setFavorite()
        checkFavorite()
    }
}
