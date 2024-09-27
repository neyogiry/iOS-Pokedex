//
//  UIViewControllerExtension.swift
//  Pokedex
//
//  Created by neyogiry on 3/01/22.
//

import UIKit

extension UIViewController {
    func changeStatusBarColor(backgroundColor: UIColor) {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        
        let statusBarView = UIView()
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
        
        statusBarView.translatesAutoresizingMaskIntoConstraints = false
        statusBarView.heightAnchor.constraint(equalToConstant: statusBarHeight).isActive = true
        statusBarView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        statusBarView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        statusBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
