//
//  NameOfClass.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 11/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.

import Foundation


extension NSObject {
    
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    var nameOfClass: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
    
}
