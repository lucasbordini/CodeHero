//
//  Comic.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 13/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import Foundation

struct Comic: Decodable {
    
    let title: String
    let thumbnail: Image
    let description: String?
    
}
