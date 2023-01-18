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

        let mainstoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = mainstoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        destinationVC.present(destinationVC, animated: true)

        destinationVC.modalPresentationStyle = .fullScreen
        destinationVC.modalTransitionStyle = .flipHorizontal
        


    }
    

}
