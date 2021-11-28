//
//  RandomCat.swift
//  NetworkApp
//
//  Created by Test on 11/28/21.
//

import Foundation

struct RandomCat {
    let catId: Int
    let catUrl: String
    let catWebpurl: String

    init?(animal: Animal) {
        catId = animal.id
        catUrl = animal.url
        catWebpurl = animal.webpurl
        
    }
}
