//
//  CircularButton.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 11/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.

import UIKit

@IBDesignable class CircularButton: UIButton {
    
    private var layerBorderColor: UIColor?
    
    @IBInspectable
    public var borderColor: UIColor {
        set {
            self.layer.cornerRadius = self.frame.height / 2
            self.layer.borderColor = newValue.cgColor
            self.layerBorderColor = newValue
            self.layer.borderWidth = 1
        } get {
            return layerBorderColor ?? UIColor.clear
        }
    }
}

