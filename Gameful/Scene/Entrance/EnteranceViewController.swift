//
//  EnteranceViewController.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 17.01.2023.
//

import UIKit

class EnteranceViewController: UIViewController {
    
    @IBOutlet weak var entranceLabel: UIButton!
    
    
    
    
    
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


extension String {
    func localized() -> String {
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
