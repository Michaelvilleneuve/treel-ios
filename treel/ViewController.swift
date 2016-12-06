//
//  ViewController.swift
//  treel
//
//  Created by michael on 01/12/2016.
//  Copyright © 2016 michael. All rights reserved.
//

import UIKit

class ViewController: GenericViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL (string: "https://app.treel.io/?mobile_app=true");
        let requestObj = URLRequest(url: url!);
        webview.loadRequest(requestObj);
        self.webview.scalesPageToFit = true
        self.webview.isHidden = true
        
        var request = URLRequest(url: URL(string: "https://app.treel.io/account/connected")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        session.dataTask(with: request) {data, response, err in
            
            let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            NSLog(dataString as! String)
            if dataString != "1" {
                DispatchQueue.main.async {
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "login_view") as! LoginViewController
                    self.present(nextViewController, animated:true, completion:nil)
                }
            }
        }.resume()
        
       
    }
    
}

