//
//  PostImages.swift
//  Navigation
//
//  Created by dmitriy on 26/6/2023.
//
import UIKit

struct PostImages {
    
    var image: String
    
    static func maketPost() -> [PostImages] {
        
        var post = [PostImages]()
        post.append(PostImages(image: "space3_01"))
        post.append(PostImages(image: "space3_03"))
        post.append(PostImages(image: "space3_06"))
        post.append(PostImages(image: "space3_07"))
        post.append(PostImages(image: "blackBear"))
        post.append(PostImages(image: "blackDolphin"))
        post.append(PostImages(image: "blackEagle"))
        post.append(PostImages(image: "blackFox"))
        post.append(PostImages(image: "blackFlamigo"))
        post.append(PostImages(image: "blackGiraffe"))
        post.append(PostImages(image: "blackGorilla"))
        post.append(PostImages(image: "blackHourse"))
        post.append(PostImages(image: "blackLeopard"))
        post.append(PostImages(image: "blackMonkey"))
        post.append(PostImages(image: "blackMoose"))
        post.append(PostImages(image: "blackPanda"))
        post.append(PostImages(image: "blackRaccoon"))
        post.append(PostImages(image: "blackMonkey2"))
        post.append(PostImages(image: "blackShark"))
        post.append(PostImages(image: "blackSnake"))
        post.append(PostImages(image: "blackTiger"))
    
        return post
    }
}
