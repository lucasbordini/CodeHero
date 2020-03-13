//
//  HeroDetailPresenter.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 13/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import Foundation
import RxSwift

class HeroDetailPresenter: Presenter {
    
    typealias T = HeroDetailViewController
    
    var viewController: HeroDetailViewController?
    
    let service = HeroDetailServiceServer()
    
    var comics: [Comic] = []
    
    let bag = DisposeBag()
    
    func loadData(for hero: Hero) {
        viewController?.showLoading()
        service.getFullInfo(for: hero).subscribe(onNext: { (res) in
            let arr = res.map { $0.results }.compactMap { $0.first }
            self.comics.append(contentsOf: arr)
            self.viewController?.reloadCollectionView()
            self.viewController?.hideLoading()
            }).disposed(by: bag)
    }
    
    func getComic(for indexPath: IndexPath) -> Comic? {
        return comics.isEmpty ? nil : comics[indexPath.row]
    }
    
}
