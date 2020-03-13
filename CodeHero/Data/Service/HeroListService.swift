//
//  HeroListService.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 12/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import Foundation
import RxSwift

protocol HeroListService {
    func getList(page: Int, with name: String) -> Observable<DataContainer<[Hero]>>
}

class HeroListServiceServer: HeroListService {
    
    func getList(page: Int, with name: String) -> Observable<DataContainer<[Hero]>> {
        let ts = Date().timestamp()
        var parameters = [URLQueryItem(name: "ts", value: ts),
                          URLQueryItem(name: "apikey", value: Constants.publicKey),
                          URLQueryItem(name: "hash", value: Crypto.MD5(from: ts + Constants.privateKey + Constants.publicKey)),
                          URLQueryItem(name: "limit", value: "4"),
                          URLQueryItem(name: "offset", value: (page * 4).toString)]
        if !name.isEmpty {
            parameters.append(URLQueryItem(name: "nameStartsWith", value: name))
        }
        return ServiceLayer<[Hero]>.request(router: .heroList, parameters: parameters)
            .flatMap { result -> Observable<DataContainer<[Hero]>> in
                return Observable<DataContainer<[Hero]>>.of(result)
        }
    }
    
}
