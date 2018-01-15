//
//  Array+.swift
//  ApplicationBaseExtensions
//
//  Created by Yuta Kawabe on 2018/01/12.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation

public extension Array {
    
    subscript (safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
    
    subscript (reverse index: Int) -> Element {
        return self[self.count - index - 1]
    }
}

public func * <T>(left: [T], right: UInt) -> [T] {
    guard right > 0 else {
        return []
    }
    var array: [T] = []
    (0..<right).forEach { _ in array.append(contentsOf: left) }
    return array
}
