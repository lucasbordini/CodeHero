//
//  HeroListCell.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 12/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import UIKit
import moa

class HeroListCell: UITableViewCell {
    
    @IBOutlet private weak var heroImageView: UIImageView!
    @IBOutlet private weak var heroNameLabel: UILabel!
    
    
    func setupCell(hero: Hero) {
        heroImageView.moa.url = hero.thumbnail.path.replacingOccurrences(of: "http", with: "https") + "/standard_medium." + hero.thumbnail.ext
        heroNameLabel.text = hero.name
    }
}
