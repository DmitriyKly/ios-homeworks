//
//  PostNews.swift
//  Navigation
//
//  Created by dmitriy on 2/7/2023.
//

import Foundation

struct Posts: ViewModelProtocol {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

