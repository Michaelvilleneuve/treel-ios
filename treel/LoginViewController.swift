//
//  ViewController.swift
//  treel
//
//  Created by michael on 01/12/2016.
//  Copyright © 2016 michael. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL (string: "https://app.treel.io/users/sign_in?mobile_app=true");
        let requestObj = URLRequest(url: url!);
        webview.loadRequest(requestObj);
        self.webview.scalesPageToFit = true
        self.webview.isHidden = false
        
       var timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.checkConnection), userInfo: nil, repeats: true)
    }
    
    func checkConnection() {
        var currentURL : NSString = (webview.request?.url?.absoluteString)! as NSString
        if String(currentURL).range(of: "/account") != nil {
            let vc : AnyObject! = self.storyboard?.instantiateViewController(withIdentifier: "main_view")
            self.show(vc as! UIViewController, sender: vc)
        }
    }
    
    @IBOutlet weak var webview: UIWebView!
}

