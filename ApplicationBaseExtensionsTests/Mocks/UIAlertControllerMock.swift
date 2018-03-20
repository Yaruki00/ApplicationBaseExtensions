//
//  UIAlertControllerMock.swift
//  ApplicationBaseExtensionsTests
//
//  Created by Yuta Kawabe on 2018/01/15.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import XCTest
@testable import ApplicationBaseExtensions

class UIAlertControllerMock: UIAlertControllerProtocol {
    
    static var title = ""
    static var message = ""
    static var style: UIAlertControllerStyle = .alert
    static var okTitle = "OK"
    static var okHandler: (() -> Void)?
    static var textOkHander: ((String) -> Void)?
    static var cancelTitle = "キャンセル"
    static var cancelHandler : (() -> Void)?
    
    static var showOkAlertCallCount = 0
    static var showOkCancelAlertCallCount = 0
    static var showOkCancelWithTextFieldAlertCallCount = 0
    
    static func showOkAlert(vc        : UIViewController,
                            title     : String,
                            message   : String,
                            style     : UIAlertControllerStyle = .alert,
                            okTitle   : String = "OK",
                            okHandler : (() -> Void)? = nil) {
        UIAlertControllerMock.title = title
        UIAlertControllerMock.message = message
        UIAlertControllerMock.style = style
        UIAlertControllerMock.okTitle = okTitle
        UIAlertControllerMock.okHandler = okHandler
        UIAlertControllerMock.showOkAlertCallCount += 1
        UIAlertController.showOkAlert(vc: vc, title: title, message: message, style: style, okTitle: okTitle, okHandler: okHandler)
    }
    
    static func showOkCancelAlert(vc            : UIViewController,
                                  title         : String,
                                  message       : String,
                                  style         : UIAlertControllerStyle = .alert,
                                  okTitle       : String = "OK",
                                  okHandler     : (() -> Void)?,
                                  cancelTitle   : String = "キャンセル",
                                  cancelHandler : (() -> Void)? = nil) {
        UIAlertControllerMock.title = title
        UIAlertControllerMock.message = message
        UIAlertControllerMock.style = style
        UIAlertControllerMock.okTitle = okTitle
        UIAlertControllerMock.okHandler = okHandler
        UIAlertControllerMock.cancelTitle = cancelTitle
        UIAlertControllerMock.cancelHandler = cancelHandler
        UIAlertControllerMock.showOkCancelAlertCallCount += 1
        UIAlertController.showOkCancelAlert(vc: vc, title: title, message: message, style: style, okTitle: okTitle, okHandler: okHandler, cancelTitle: cancelTitle, cancelHandler: cancelHandler)
    }
    
    static func showOkCancelWithTextFieldAlert(vc            : UIViewController,
                                               title         : String,
                                               message       : String,
                                               style         : UIAlertControllerStyle = .alert,
                                               okTitle       : String = "OK",
                                               okHandler     : ((String) -> Void)?,
                                               cancelTitle   : String = "キャンセル",
                                               cancelHandler : (() -> Void)? = nil) {
        UIAlertControllerMock.title = title
        UIAlertControllerMock.message = message
        UIAlertControllerMock.style = style
        UIAlertControllerMock.okTitle = okTitle
        UIAlertControllerMock.textOkHander = okHandler
        UIAlertControllerMock.cancelTitle = cancelTitle
        UIAlertControllerMock.cancelHandler = cancelHandler
        UIAlertControllerMock.showOkCancelWithTextFieldAlertCallCount += 1
        UIAlertController.showOkCancelWithTextFieldAlert(vc: vc, title: title, message: message, style: style, okTitle: okTitle, okHandler: okHandler, cancelTitle: cancelTitle, cancelHandler: cancelHandler)
    }
}

extension UIAlertControllerMock {
    
    static func check_showOkAlert(title     : String,
                                  message   : String,
                                  style     : UIAlertControllerStyle = .alert,
                                  okTitle   : String = "OK",
                                  file      : StaticString = #file,
                                  line      : UInt = #line) {
        XCTAssertEqual(UIAlertControllerMock.title, title, "title", file: file, line: line)
        XCTAssertEqual(UIAlertControllerMock.message, message, "message", file: file, line: line)
        XCTAssertEqual(UIAlertControllerMock.style, style, "style", file: file, line: line)
        XCTAssertEqual(UIAlertControllerMock.okTitle, okTitle, "okTitle", file: file, line: line)
        XCTAssertEqual(UIAlertControllerMock.showOkAlertCallCount, 1, "showOkAlertCallCount", file: file, line: line)
    }
    
    static func check_showOkCancelAlert(title         : String,
                                        message       : String,
                                        style         : UIAlertControllerStyle = .alert,
                                        okTitle       : String = "OK",
                                        cancelTitle   : String = "キャンセル",
                                        file          : StaticString = #file,
                                        line          : UInt = #line) {
        XCTAssertEqual(UIAlertControllerMock.title, title, "title", file: file, line: line)
        XCTAssertEqual(UIAlertControllerMock.message, message, "message", file: file, line: line)
        XCTAssertEqual(UIAlertControllerMock.style, style, "style", file: file, line: line)
        XCTAssertEqual(UIAlertControllerMock.okTitle, okTitle, "okTitle", file: file, line: line)
        XCTAssertEqual(UIAlertControllerMock.cancelTitle, cancelTitle, "cancelTitle", file: file, line: line)
        XCTAssertEqual(UIAlertControllerMock.showOkCancelAlertCallCount, 1, "showOkCancelAlertCallCount", file: file, line: line)
    }
    
    static func showOkCancelWithTextFieldAlert(title         : String,
                                               message       : String,
                                               style         : UIAlertControllerStyle = .alert,
                                               okTitle       : String = "OK",
                                               cancelTitle   : String = "キャンセル",
                                               file          : StaticString = #file,
                                               line          : UInt = #line) {
        XCTAssertEqual(UIAlertControllerMock.title, title, "title", file: file, line: line)
        XCTAssertEqual(UIAlertControllerMock.message, message, "message", file: file, line: line)
        XCTAssertEqual(UIAlertControllerMock.style, style, "style", file: file, line: line)
        XCTAssertEqual(UIAlertControllerMock.okTitle, okTitle, "okTitle", file: file, line: line)
        XCTAssertEqual(UIAlertControllerMock.cancelTitle, cancelTitle, "cancelTitle", file: file, line: line)
        XCTAssertEqual(UIAlertControllerMock.showOkCancelWithTextFieldAlertCallCount, 1, "showOkCancelWithTextFieldAlertCallCount", file: file, line: line)
    }
}
