//
//  PostView.swift
//  Navigation
//
//  Created by dmitriy on 24/6/2023.
//

import UIKit

struct PostView {
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int

        
        static func makePost() -> [PostView] {
            var postView = [PostView]()
            postView.append(PostView(author: "Kot_Matroskin", description: "Играю на гитаре", image: "Kot_Matroskin", likes: 20, views: 100))
            postView.append(PostView(author: "Pes_Sharik", description: "Поймал бобра", image: "Pes_Sharik", likes: 15, views: 50))
            postView.append(PostView(author: "Kesha", description: "Делаю вид что не позирую", image: "Kesha", likes: 50, views: 200))
            postView.append(PostView(author: "Vorona", description: "На этот раз я точно не поведусь", image: "Vorona", likes: 10, views: 80))
            return postView
        }
    }

   
    

