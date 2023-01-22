//
//  FilterTableViewTitleCell.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 21.01.2023.
//

import UIKit

class FilterTableViewTitleCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(title: String) {
        titleLabel.text = title
    }
    
}
