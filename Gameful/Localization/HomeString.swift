//
//  HomeString.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 25.01.2023.
//

import Foundation

enum HomeString: String {
    case labelTitle
    
    var localized: String {
        NSLocalizedString(String(describing: Self.self) + " \(rawValue)", comment: "")
    }
}
