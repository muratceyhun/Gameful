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
    
    
    var gamePhoto = ""
    var gameIdNumber : Int = 0
    var gameTitleName = ""
    var rating = ""
    var releaseDate = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameImage.loadURL(url: gamePhoto)
        gameId.text = String(gameIdNumber)
        gameTitle.text = gameTitleName
        ratingLabel.text = rating
        releaseDateLabel.text = releaseDate

    }
}
