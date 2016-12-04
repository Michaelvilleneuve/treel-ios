//
//  CustomTabBarViewController.swift
//  treel
//
//  Created by michael on 02/12/2016.
//  Copyright © 2016 michael. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for var viewController in self.viewControllers! {
            let _ = viewController.view
        }

    }

}
