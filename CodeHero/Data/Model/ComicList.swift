//
//  ComicList.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 13/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import Foundation

struct ComicList: Decodable {
    
    var available: Int?
    var items: [ComicSummary]
    
}
