//
//  UIScrollView+.swift
//  ApplicationBaseExtensions
//
//  Created by Yuta Kawabe on 2018/01/12.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation

extension UIScrollView {
    
    public func addRefreshControl(target: Any, action: Selector, color: UIColor = .white) -> UIRefreshControl {
        let refreshControl  = UIRefreshControl()
        refreshControl.tintColor = color
        refreshControl.addTarget(target, action: action, for: .valueChanged)
        self.addSubview(refreshControl)
        return refreshControl
    }
}
