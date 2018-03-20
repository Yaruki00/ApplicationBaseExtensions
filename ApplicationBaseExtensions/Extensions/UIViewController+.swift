//
//  UIViewController+.swift
//  ApplicationBaseExtensions
//
//  Created by Yuta Kawabe on 2018/01/12.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import Foundation

extension UIViewController {
    
    @IBAction public func dismiss(_ sender: Any? = nil) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction public func pop(_ sender: Any? = nil) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UIViewController: StoryBoardInstantiatable {}

public protocol StoryBoardInstantiatable {}
extension StoryBoardInstantiatable where Self: UIViewController {
    
    public static func instantiate() -> Self {
        let bundle = Bundle(for: self.self)
        let name = String(describing: self.self)
        
        guard let vc = UIStoryboard(name: name, bundle: bundle).instantiateInitialViewController() as? Self else {
            fatalError("UIViewController.instantiate() failed: \(name)")
        }
        
        return vc
    }
}
