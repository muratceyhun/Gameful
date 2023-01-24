//
//  EnteranceViewController.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 17.01.2023.
//

import UIKit

class EnteranceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func enterButtonClicked(_ sender: Any) {

        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController {
            destinationVC.modalPresentationStyle = .fullScreen
            destinationVC.modalTransitionStyle = .flipHorizontal
            self.present(destinationVC, animated: true)
                    
        }
    }
}
