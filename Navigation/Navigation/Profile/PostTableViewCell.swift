//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by dmitriy on 23/6/2023.
//

import UIKit

struct PostView {
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
}

let posts = [
    PostView(author: "Kot_Matroskin", description: "Играю на гитаре", image: "Kot_Matroskin", likes: 20, views: 100),
    PostView(author: "Pes_Sharik", description: "Поймал бобра", image: "Pes_Sharik", likes: 15, views: 50),
    PostView(author: "Kesha", description: "Делаю вид что не позирую", image: "Kesha", likes: 50, views: 200),
    PostView(author: "Vorona", description: "На этот раз я точно не поведусь", image: "Vorona", likes: 10, views: 80)
]
