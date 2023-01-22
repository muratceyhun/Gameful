//
//  Storyboard File.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 21.01.2023.
//

import Foundation
import UIKit

enum StoryboardName: String {
    case main = "Main"
}

protocol StoryboardProtocol {
    static func instantiate(name: StoryboardName) -> Self
}

extension StoryboardProtocol where Self: UIViewController {
    static func instantiate(name: StoryboardName) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: name.rawValue, bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
