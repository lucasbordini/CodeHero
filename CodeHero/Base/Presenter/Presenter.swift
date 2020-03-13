//
//  Presenter.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 12/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import Foundation
import RxSwift

protocol Presenter: class {
    associatedtype T
    
    var viewController: T? { get set }
    
    func attachView(_ viewController: T)
    
    var bag: DisposeBag { get }
}

extension Presenter {
    func attachView(_ viewController: T) {
        self.viewController = viewController
    }
}
