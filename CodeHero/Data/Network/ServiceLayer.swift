//
//  ServiceLayer.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 11/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import Foundation
import RxSwift

class ServiceLayer<T: Decodable> {
    
    static func request(router: Router, parameters: [URLQueryItem]) -> Observable<DataContainer<T>> {
        var components: URLComponents = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = parameters
        
        guard let url = components.url else { return Observable.error(MarvelError.url)}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        
        return Observable<DataContainer<T>>.create { observer in
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    observer.onError(error)
                    dump(error.localizedDescription)
                }
                guard response != nil else { return }
                guard let data = data else { return }
                do {
                    let response = try JSONDecoder().decode(MarvelResponse<T>.self, from: data)
                    if let dataContainer = response.data {
                        observer.onNext(dataContainer)
                    } else if let message = response.message {
                        observer.onError(MarvelError.server(message: message))
                    } else {
                        observer.onError(MarvelError.decoding)
                    }
                } catch {
                    
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            dataTask.resume()
            return Disposables.create {
                dataTask.cancel()
            }
        }
    }
    
}


