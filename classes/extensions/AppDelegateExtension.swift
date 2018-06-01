//
//  AppDelegateExtension.swift
//  Mojaz
//
//  Created by abuzeid ibrahim on 5/9/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import Foundation
import UIKit

extension UIApplicationDelegate {

    static func getCurrentWindow() -> UIWindow? {
        if let app = UIApplication.shared.delegate, let window = app.window {
            return window
        }
        return nil
    }
/**
     swinject 
    func setupWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .black
        window.makeKeyAndVisible()
        let storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil)
        _ = storyboard.instantiateInitialViewController()

        window.rootViewController = getRootController()

        self.window = window
    }
*/
 }
