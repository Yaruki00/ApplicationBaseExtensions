//
//  UIAlertControllerTests.swift
//  ApplicationBaseExtensionsTests
//
//  Created by Yuta Kawabe on 2018/01/15.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import XCTest
@testable import ApplicationBaseExtensions

class UIAlertControllerTests: XCTestCase {
    
    var okHandlerCount = 0
    var cancelHandkerCount = 0
    
    func test_showOkAlert() {
        
        // prepare
        let vc = UIViewController()
        UIApplication.shared.keyWindow?.rootViewController = vc
        let title = "title"
        let message = "message"
        let style: UIAlertControllerStyle = .alert
        let okTitle = "ok title"
        let okHandler: () -> Void = {
            self.okHandlerCount += 1
        }
        
        // call
        UIAlertController.showOkAlert(vc: vc, title: title, message: message, style: style, okTitle: okTitle, okHandler: okHandler)
        Utility.delay(testCase: self, seconds: 2.0)
        
        // check
        guard let alert = vc.presentedViewController as? UIAlertController else {
            XCTFail("alert is nil or wrong type")
            return
        }
        XCTAssertEqual(alert.title, title)
        XCTAssertEqual(alert.message, message)
        XCTAssertEqual(alert.preferredStyle, style)
        guard let okAction = alert.actions.first else {
            XCTFail("okAction is nil")
            return
        }
        XCTAssertEqual(okAction.title, okTitle)
        let action = okAction.value(forKey: "handler")
        print(action)
    }
}
