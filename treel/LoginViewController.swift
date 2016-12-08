//
//  ViewController.swift
//  treel
//
//  Created by michael on 01/12/2016.
//  Copyright © 2016 michael. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIWebViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL (string: "https://app.treel.io/users/sign_in?mobile_app=true");
        let requestObj = URLRequest(url: url!);
        webview.loadRequest(requestObj);
        self.webview.scalesPageToFit = true
        self.webview.isHidden = false
    }
    
    
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if request.url?.absoluteString.range(of: "/account") != nil {
            self.dismiss(animated: true)
            return false
        }
        return true
    }
    
    @IBOutlet weak var webview: UIWebView!
}

