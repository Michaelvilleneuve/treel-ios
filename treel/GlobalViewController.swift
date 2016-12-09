//
//  ViewController.swift
//  treel
//
//  Created by michael on 01/12/2016.
//  Copyright © 2016 michael. All rights reserved.
//

import UIKit

class GlobalViewController: GenericViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL (string: Shared.shared.stringValue);
        let requestObj = URLRequest(url: url!);
        webview.loadRequest(requestObj);
        self.webview.scalesPageToFit = true
        self.webview.isHidden = true
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Fermer", style: .plain, target: self, action: #selector(close))
    }
    
    func close() {
        self.dismiss(animated: true)
    }
    
}

