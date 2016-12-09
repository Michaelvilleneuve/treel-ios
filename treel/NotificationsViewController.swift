//
//  ViewController.swift
//  treel
//
//  Created by michael on 01/12/2016.
//  Copyright © 2016 michael. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL (string: "https://app.treel.io/notifications?mobile_app=true");
        let requestObj = URLRequest(url: url!);
        webview.loadRequest(requestObj);
        self.webview.scalesPageToFit = true
        self.webview.isHidden = false
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if request.url?.absoluteString.range(of: "/notifications") == nil {
            Shared.shared.stringValue = request.url?.absoluteString
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "global")
            self.present(nextViewController, animated:true, completion:nil)
            return false
        } else {
            return true
        }
    }
}

