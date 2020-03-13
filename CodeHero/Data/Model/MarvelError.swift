//
//  MarvelError.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 12/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import Foundation

public enum MarvelError: Error {
    case encoding
    case decoding
    case url
    case server(message: String)
}
