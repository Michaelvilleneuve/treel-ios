//
//  ViewController.swift
//  treel
//
//  Created by michael on 01/12/2016.
//  Copyright © 2016 michael. All rights reserved.
//

import UIKit

class NewIdeaViewController: GenericViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL (string: "https://app.treel.io/ideas/new?mobile_app=true");
        let requestObj = URLRequest(url: url!);
        webview.loadRequest(requestObj);
        self.webview.scalesPageToFit = true
        self.webview.isHidden = true
        super.hideRefresh()
    }
    
}

