//
//  ViewController.swift
//  CodeHero
//
//  Created by Lucas Bordini Ribeiro de Araujo on 12/03/20.
//  Copyright © 2020 Lucas Bordini Ribeiro de Araujo. All rights reserved.
//

import UIKit

protocol ViewController: UIViewController {
    
    associatedtype T
    
    var presenter: T { get }
    
    func showLoading()
    func hideLoading()
    
}

extension ViewController {
    
    func showLoading() {
        let loadingView = LoadingView()
        loadingView.tag = 1
        self.view.addSubview(loadingView)
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.view.viewWithTag(1)?.removeFromSuperview()
        }
    }
    
}
