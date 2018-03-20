//
//  Bundle+.swift
//  ApplicationBaseExtensions
//
//  Created by Yuta Kawabe on 2018/03/20.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation
import UIKit

extension Bundle {
    
    static func loadView(instance: UIView) -> UIView? {
        let t = type(of: instance)
        let bundle = Bundle(for: t)
        let nib = UINib(nibName: String(describing: t), bundle: bundle)
        return nib.instantiate(withOwner: instance, options: nil).first as? UIView
    }
}
