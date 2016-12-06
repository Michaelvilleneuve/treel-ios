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
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if request.url?.absoluteString.range(of: "https://app.treel.io/share") != nil {
            share(request: (request.url?.absoluteString)!)
            return false
        } else {
            print("whowho")
            return true
        }
    }
    
    func share(request: String) {
        var urlToShare = request.components(separatedBy: "#")
        print(request)
        if urlToShare.indices.contains(1) {
            let shareText = "Hé, regarde ça sur Treel :  \(urlToShare[1])"
            
            let activityViewController : UIActivityViewController = UIActivityViewController(
                activityItems: [shareText], applicationActivities: nil)
            
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    func hideRefresh() {
        let viewWithTag = self.view.viewWithTag(100)
        viewWithTag?.removeFromSuperview()
    }
    
    
    
    @IBOutlet weak var webview: UIWebView!
    
}

