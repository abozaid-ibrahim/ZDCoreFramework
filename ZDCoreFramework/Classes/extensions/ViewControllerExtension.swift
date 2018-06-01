//
//  ViewControllerExtension.swift
//  Mojaz
//
//  Created by Mojaz on 5/15/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import UIKit

extension  UIViewController {
    func addChild( child: UIViewController, inView: UIView? = nil) {
        self.addChildViewController(child)
         (inView ?? self.view).addSubview(child.view)
        child.didMove(toParentViewController: self)
    }

    func removeChild(child: UIViewController) {
        child.willMove(toParentViewController: nil)
        child.removeFromParentViewController()
        child.view.removeFromSuperview()
    }

}
