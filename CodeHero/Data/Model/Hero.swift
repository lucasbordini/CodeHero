//
//  Hero.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 12/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import Foundation

struct Hero: Decodable {
    
    var id: Int
    var name: String
    var description: String?
    var comics: ComicList
    var resourceURI: String
    var thumbnail: Image
    
}
