//
//  ViewController.swift
//  treel
//
//  Created by michael on 01/12/2016.
//  Copyright © 2016 michael. All rights reserved.
//

import UIKit

class EditAccountViewController: GenericViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL (string: "https://app.treel.io/account/?mobile_app=true");
        let requestObj = URLRequest(url: url!);
        webview.loadRequest(requestObj);
        self.webview.scalesPageToFit = true
        self.webview.isHidden = true
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Enregistrer", style: .plain, target: self, action: #selector(saveInfos))
    }
    
    func saveInfos() {
        webview.stringByEvaluatingJavaScript(from: "$('form').submit()")
    }
    
}

