//
//  PostImages.swift
//  Navigation
//
//  Created by dmitriy on 26/6/2023.
//
import UIKit

struct ImagesHeader {
    
    var image: String
    
    static func maketPost() -> [ImagesHeader] {
        
        var post = [ImagesHeader]()
        post.append(ImagesHeader(image: "space3_01"))
        post.append(ImagesHeader(image: "space3_03"))
        post.append(ImagesHeader(image: "space3_06"))
        post.append(ImagesHeader(image: "space3_07"))
        post.append(ImagesHeader(image: "space3_08"))
        post.append(ImagesHeader(image: "space3_09"))
        post.append(ImagesHeader(image: "space3_12"))
        post.append(ImagesHeader(image: "space3_13"))
        post.append(ImagesHeader(image: "space3_14"))
        post.append(ImagesHeader(image: "space3_16"))
        post.append(ImagesHeader(image: "space3_19"))
        post.append(ImagesHeader(image: "space3_23"))
        post.append(ImagesHeader(image: "space3_24"))
        post.append(ImagesHeader(image: "space3_25"))
        post.append(ImagesHeader(image: "space3_26"))
        post.append(ImagesHeader(image: "space3_27"))
        post.append(ImagesHeader(image: "space3_30"))
    
        return post
    }
}
