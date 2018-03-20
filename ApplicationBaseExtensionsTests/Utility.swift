//
//  Utility.swift
//  ApplicationBaseExtensionsTests
//
//  Created by Yuta Kawabe on 2018/01/15.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import XCTest

class Utility {
    
    static func delay(testCase: XCTestCase, seconds: Float) {
        let delay = testCase.expectation(description: "timeout")
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(seconds)) {
            delay.fulfill()
        }
        testCase.waitForExpectations(timeout: TimeInterval(seconds + 1.0))
    }
}
