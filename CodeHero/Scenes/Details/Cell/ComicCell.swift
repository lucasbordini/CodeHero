//
//  ComicCell.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 13/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import UIKit

class ComicCell: UITableViewCell {
    
    @IBOutlet weak private var comicImageView: UIImageView!
    @IBOutlet weak private var comicNameLabel: UILabel!
    @IBOutlet weak private var comicDescriptionLabel: UILabel!
    
    func setupCell(comic: Comic) {
        comicImageView.moa.url = comic.thumbnail.path.replacingOccurrences(of: "http", with: "https") + "/standard_medium." + comic.thumbnail.ext
        comicNameLabel.text = comic.title
        comicDescriptionLabel.text = comic.description
    }
}
