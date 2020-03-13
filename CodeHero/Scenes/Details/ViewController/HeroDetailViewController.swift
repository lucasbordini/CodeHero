//
//  DetailViewController.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 13/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController, ViewController {
    
    @IBOutlet weak private var heroImageView: UIImageView!
    @IBOutlet weak private var heroNameLabel: UILabel!
    @IBOutlet weak private var heroDescriptionLabel: UILabel!
    @IBOutlet weak private var comicsTableView: UITableView!
    
    typealias T = HeroDetailPresenter
    
    var presenter: HeroDetailPresenter = HeroDetailPresenter()
    
    var hero: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
        if let hero = hero {
            presenter.loadData(for: hero)
            setupView()
        }
    }
    
    func setupView() {
        if let hero = hero {
            heroImageView.moa.url = hero.thumbnail.path.replacingOccurrences(of: "http", with: "https") + "/standard_fantastic." + hero.thumbnail.ext
            heroNameLabel.text = hero.name
            heroDescriptionLabel.text = hero.description?.isEmpty == true ? "Hero description not provided" : hero.description
        }
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.comicsTableView.reloadData()
        }
    }
    
}

extension HeroDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "comicCell") as? ComicCell,
            let comic = presenter.getComic(for: indexPath) else { return UITableViewCell() }
        cell.setupCell(comic: comic)
        return cell
    }
    
}
