//
//  WebViewController.swift
//  NewsApp
//
//  Created by Harshit Sharma on 25/07/18.
//  Copyright © 2018 NIC. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    // MARK: Make property for url that will be call from the feed page class and pass into web view as url
    var urlString = ""
    
    // MARK: View Properties
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    // MARK: ViewLife Cycle method 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: Setup Webview
    fileprivate func initialSetup() ->Void {
        webView.delegate = self
        self.view.bringSubview(toFront: self.indicator)
        self.indicator.startAnimating()
        self.webView.loadRequest(URLRequest(url: URL(string: self.urlString)!))
    }
    
    internal func webViewDidFinishLoad(_ webView: UIWebView) {
        self.indicator.stopAnimating()
    }
}
