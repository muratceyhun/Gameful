//
//  FilterViewModel.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 21.01.2023.
//

import Foundation




class FilterViewModel {
    var items = [FilterModel(title: "All", category: .all),
                 FilterModel(title: "Popularity", category: .popularity),
                 FilterModel(title: "Average Rating", category: .averageRating),
                 FilterModel(title: "Release Date", category: .releaseDate)]
}

