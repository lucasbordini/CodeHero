//
//  Request.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 12/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import Foundation

struct MarvelResponse<Response: Decodable>: Decodable {
    let status: String?
    let message: String?
    let data: DataContainer<Response>?
}

