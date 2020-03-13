//
//  HeroDetailsService.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 13/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import Foundation
import RxSwift

protocol HeroDetailService {
    func getFullInfo(for hero: Hero) -> Observable<[DataContainer<[Comic]>]>
}

class HeroDetailServiceServer: HeroDetailService {
    
    func getFullInfo(for hero: Hero) -> Observable<[DataContainer<[Comic]>]> {
        let ts = Date().timestamp()
        let parameters = [URLQueryItem(name: "ts", value: ts),
                          URLQueryItem(name: "apikey", value: Constants.publicKey),
                          URLQueryItem(name: "hash", value: Crypto.MD5(from: ts + Constants.privateKey + Constants.publicKey))]
        return ServiceLayer<[Hero]>.request(router: .heroDetail(url: hero.resourceURI), parameters: parameters)
            .map { $0.results.first! }
            .map { $0.comics }
            .map { $0.items }
            .flatMap { Observable<DataContainer<[Comic]>>
                .combineLatest($0
                    .map { ServiceLayer<[Comic]>
                        .request(router: .comic(url: $0.resourceURI), parameters: parameters)
                })
        }
        
    }
}
