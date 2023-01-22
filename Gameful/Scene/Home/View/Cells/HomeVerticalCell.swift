//
//  HomeVerticalCell.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 18.01.2023.
//

import UIKit
import SDWebImage

protocol GameCellProtocol {
    var gamePosterImage: String { get }
    var gameID: Int { get }
    var gameTitleText: String { get }
    var ratingText: String { get }
    var releaseDateText: String { get }
}

class HomeVerticalCell: UICollectionViewCell {
    
    @IBOutlet private weak var gameImage: UIImageView!
    @IBOutlet private weak var gameTitle: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var gameIDNumber: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    
    
    
    func configure(data: GameCellProtocol) {
        
        gameImage.loadURL(url: data.gamePosterImage)
        gameIDNumber.text = String(data.gameID)
        gameTitle.text = data.gameTitleText
        ratingLabel.text = data.ratingText
        releaseDateLabel.text = data.releaseDateText
        
        
    }
}
