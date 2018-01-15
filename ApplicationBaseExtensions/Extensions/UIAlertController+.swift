//
//  UIAlertController+.swift
//  ApplicationBaseExtensions
//
//  Created by Yuta Kawabe on 2018/01/12.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation

public protocol UIAlertControllerProtocol {
    static func showOkAlert(vc        : UIViewController,
                            title     : String,
                            message   : String,
                            style     : UIAlertControllerStyle,
                            okTitle   : String,
                            okHandler : (() -> Void)?)
    static func showOkCancelAlert(vc            : UIViewController,
                                  title         : String,
                                  message       : String,
                                  style         : UIAlertControllerStyle,
                                  okTitle       : String,
                                  okHandler     : (() -> Void)?,
                                  cancelTitle   : String,
                                  cancelHandler : (() -> Void)?)
    static func showOkCancelWithTextFieldAlert(vc            : UIViewController,
                                               title         : String,
                                               message       : String,
                                               style         : UIAlertControllerStyle,
                                               okTitle       : String,
                                               okHandler     : ((String) -> Void)?,
                                               cancelTitle   : String,
                                               cancelHandler : (() -> Void)?)
}

extension UIAlertController: UIAlertControllerProtocol {
    
    public static func showOkAlert(vc        : UIViewController,
                            title     : String,
                            message   : String,
                            style     : UIAlertControllerStyle = .alert,
                            okTitle   : String = "OK",
                            okHandler : (() -> Void)? = nil) {
        let alert = UIAlertController(
            title          : title,
            message        : message,
            preferredStyle : .alert
        )
        alert.addAction(UIAlertAction(
            title   : "OK",
            style   : .default,
            handler : { _ in
                okHandler?()
        }))
        vc.present(alert, animated: true, completion: nil)
    }
    
    public static func showOkCancelAlert(vc            : UIViewController,
                                  title         : String,
                                  message       : String,
                                  style         : UIAlertControllerStyle = .alert,
                                  okTitle       : String = "OK",
                                  okHandler     : (() -> Void)?,
                                  cancelTitle   : String = "キャンセル",
                                  cancelHandler : (() -> Void)? = nil) {
        let alert = UIAlertController(
            title          : title,
            message        : message,
            preferredStyle : style
        )
        alert.addAction(UIAlertAction(
            title   : okTitle,
            style   : .default,
            handler : { _ in
                okHandler?()
        }))
        alert.addAction(UIAlertAction(
            title   : cancelTitle,
            style   : .cancel,
            handler : { _ in
                cancelHandler?()
        }))
        vc.present(alert, animated: true, completion: nil)
    }
    
    public static func showOkCancelWithTextFieldAlert(vc            : UIViewController,
                                               title         : String,
                                               message       : String,
                                               style         : UIAlertControllerStyle = .alert,
                                               okTitle       : String = "OK",
                                               okHandler     : ((String) -> Void)?,
                                               cancelTitle   : String = "キャンセル",
                                               cancelHandler : (() -> Void)? = nil) {
        let alert = UIAlertController(
            title          : title,
            message        : message,
            preferredStyle : style
        )
        alert.addAction(UIAlertAction(
            title   : okTitle,
            style   : .default,
            handler : { _ in
                let text = alert.textFields?.first?.text ?? ""
                okHandler?(text)
        }))
        alert.addAction(UIAlertAction(
            title   : cancelTitle,
            style   : .cancel,
            handler : { _ in
                cancelHandler?()
        }))
        alert.addTextField(configurationHandler: nil)
        vc.present(alert, animated: true, completion: nil)
    }
}
