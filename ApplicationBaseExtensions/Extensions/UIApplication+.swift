//
//  UIApplication+.swift
//  ApplicationBaseExtensions
//
//  Created by Yuta Kawabe on 2018/01/12.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation

public protocol UIApplicationProtocol {
    func openURL(url: URL)
}

extension UIApplication: UIApplicationProtocol {
    
    public func openURL(url: URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:])
        }
        else {
            UIApplication.shared.openURL(url)
        }
    }
}
