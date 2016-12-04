//
//  ViewController.swift
//  treel
//
//  Created by michael on 01/12/2016.
//  Copyright © 2016 michael. All rights reserved.
//

import UIKit

class GenericViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    var refreshControl: UIRefreshControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(ViewController.refreshWebView), for: UIControlEvents.valueChanged)
        refreshControl.tag = 100
        self.webview.scrollView.addSubview(refreshControl)
        
    }
    
    func refreshWebView() {
        loader.startAnimating()
        webview.reload();
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loader.stopAnimating()
        refreshControl.endRefreshing()
        self.webview.isHidden = false
    }
    
    func hideRefresh() {
        let viewWithTag = self.view.viewWithTag(100)
        viewWithTag?.removeFromSuperview()
    }
    
    
    
    @IBOutlet weak var webview: UIWebView!
    
}

