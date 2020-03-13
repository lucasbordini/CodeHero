//
//  ViewController.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 11/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ESPullToRefresh

class HeroListViewController: UIViewController, ViewController {
    
    @IBOutlet private weak var heroListTableView: UITableView!
    @IBOutlet private weak var heroSearchTextField: UITextField!
    
    typealias T = HeroListPresenter
    var presenter: HeroListPresenter = HeroListPresenter()
    
    let cellIdentifier = "heroListCell"
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
        presenter.loadData()
        observeTextField()
        prepareTable()
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.heroListTableView.reloadData()
            self.heroListTableView.es.stopLoadingMore()
        }
    }
    
    func prepareTable() {
        heroListTableView.es.addInfiniteScrolling { [weak self] in
            if self?.presenter.hasMore() == true {
                self?.presenter.loadMore(with: self?.heroSearchTextField.text ?? "")
            } else {
                self?.heroListTableView.es.stopLoadingMore()
                self?.heroListTableView.es.noticeNoMoreData()
            }
        }
    }
    
    func resetInfiniteScroll() {
        heroListTableView.es.resetNoMoreData()
    }

    
    private func observeTextField() {
        heroSearchTextField
            .rx
            .text
            .distinctUntilChanged()
            .delay(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
            .asObservable()
            .subscribe(onNext: { text in
                guard let text = text else { return }
                self.presenter.page = 0
                self.presenter.loadData(with: text)
            }).disposed(by: bag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? HeroDetailViewController, let hero = sender as? Hero {
            vc.hero = hero
        }
    }
    
}

extension HeroListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.content?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? HeroListCell,
            let hero = presenter.content?.results[indexPath.row] else { return UITableViewCell() }
        cell.setupCell(hero: hero)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let hero = presenter.getHeroFor(indexPath) else { return }
        performSegue(withIdentifier: "heroDetails", sender: hero)
    }
    
    
}

