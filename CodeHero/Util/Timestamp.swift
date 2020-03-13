//
//  Timestamp.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 12/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import Foundation

extension Date {
    
    func timestamp() -> String {
        return String(Int64(self.timeIntervalSince1970 * 1000))
    }
}
