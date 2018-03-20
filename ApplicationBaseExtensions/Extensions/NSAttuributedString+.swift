//
//  NSAttuributedString+.swift
//  ApplicationBaseExtensions
//
//  Created by Yuta Kawabe on 2018/03/20.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation
import UIKit

extension NSAttributedString {
    
    convenience init(string: String, lineSpacing: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        let attributes = [
            NSAttributedStringKey.paragraphStyle: paragraphStyle,
            ]
        self.init(string: string, attributes: attributes)
    }
}
