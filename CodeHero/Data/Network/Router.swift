//
//  Router.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 11/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import Foundation


enum Router {
    
    case heroList
    case comic(url: String)
    case heroDetail(url: String)
    
    var scheme: String {
        switch self {
        case .heroList, .comic, .heroDetail:
            return "https"
        }

    }
    
    var host: String {
        switch self {
        case .heroList, .comic, .heroDetail:
            return "gateway.marvel.com"
        }
    }
    
    var path: String {
        switch self {
        case .heroList:
            return "/v1/public/characters"
        case .comic(let url):
            return url.replacingOccurrences(of: Constants.baseURL, with: "")
        case .heroDetail(let url):
            return url.replacingOccurrences(of: Constants.baseURL, with: "")
        }
    }
    
    var method: String {
        switch self {
        case .heroList, .comic, .heroDetail:
            return "GET"
        }

    }
        
}
