//
//  RequestData.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 12/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import Foundation

struct DataContainer<Results: Decodable>: Decodable {
    
    let limit: Int
    let total: Int
    var offset: Int
    var count: Int
    var results: Results
    

}
