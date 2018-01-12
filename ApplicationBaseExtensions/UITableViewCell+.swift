//
//  UITableViewCell+.swift
//  ApplicationBaseExtensions
//
//  Created by Yuta Kawabe on 2018/01/12.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation

extension UITableViewCell {
    
    static var nib: UINib { return UINib(nibName: String(describing: self.self), bundle: nil) }
    
    static var name: String { return String(describing: self.self) }
}
