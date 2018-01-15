//
//  UIStackView+.swift
//  ApplicationBaseExtensions
//
//  Created by Yuta Kawabe on 2018/01/12.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation

extension UIStackView {
    
    func removeAllArangedSubView() {
        self.arrangedSubviews.forEach { v in
            self.removeArrangedSubview(v)
            v.removeFromSuperview()
        }
    }
}
