//
//  Image.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 12/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import Foundation

struct Image {
    
    var path: String
    var ext: String
    
}

extension Image: Codable {
    
    enum CodingKeys: String, CodingKey {
        case path = "path"
        case ext = "extension"
    }
    
}
