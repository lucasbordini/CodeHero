//
//  HeroListPresenter.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 12/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import Foundation
import RxSwift

class HeroListPresenter: Presenter {
    
    typealias T = HeroListViewController
    
    var viewController: HeroListViewController?
    
    let service = HeroListServiceServer()
    
    var content: DataContainer<[Hero]>?
    
    var page = 0
    
    let bag = DisposeBag()
    
    func loadData(with name: String = "") {
        viewController?.showLoading()
        service.getList(page: 0, with: name)
            .subscribe(onNext: { (data: DataContainer<[Hero]>) in
                self.content = data
                self.viewController?.reloadTable()
                self.viewController?.resetInfiniteScroll()
                self.viewController?.hideLoading()
            }).disposed(by: bag)
    }
    
    func loadMore(with name: String) {
        viewController?.showLoading()
        if hasMore() == true {
            page += 1
        }
        service.getList(page: page, with: name)
            .subscribe(onNext: { (data: DataContainer<[Hero]>) in
                self.content?.results.append(contentsOf: data.results)
                self.content?.count = data.count
                self.content?.offset = data.offset
                self.viewController?.reloadTable()
                self.viewController?.hideLoading()
            }).disposed(by: bag)
    }
    
    func getHeroFor(_ indexPath: IndexPath) -> Hero? {
        return content?.results.isEmpty == true ? nil : content?.results[indexPath.row]
    }
    
    func hasMore() -> Bool {
        return ((content?.count ?? 0) + (content?.offset ?? 0) <= (content?.total ?? 0))
    }
    
    
    
}
