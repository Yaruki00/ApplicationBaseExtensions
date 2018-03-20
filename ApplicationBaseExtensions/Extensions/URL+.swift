//
//  URL+.swift
//  ApplicationBaseExtensions
//
//  Created by Yuta Kawabe on 2018/01/12.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation

public extension URL {
    
    public init(nullableOrEmptableString: String?) {
        guard let urlString = nullableOrEmptableString,
            !urlString.isEmpty else {
                self.init(string: "about:blank")!
                return
        }
        self.init(string: urlString)!
    }
}
