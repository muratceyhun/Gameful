//
//  HomeHorizontalCell.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 18.01.2023.
//

import UIKit

class HomeHorizontalCell: UICollectionViewCell {
    
    @IBOutlet private weak var gameImage: UIImageView!
    @IBOutlet private weak var gameTitle: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    
    func configure(data: GameCellProtocol) {
        gameTitle.text = data.gameTitleText
        ratingLabel.text = data.ratingText
        gameImage.loadURL(url: data.gamePosterImage)
    }
}


