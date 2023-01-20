//
//  UIImageView+Extension.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 20.01.2023.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func loadURL(url: String) {
        if let url = URL(string: url) {
            sd_setImage(with: url)
        }
    }
}
