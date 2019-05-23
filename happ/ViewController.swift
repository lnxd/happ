//
//  ViewController.swift
//  happ
//
//  Created by Alex Findlay on 22/5/19.
//  Copyright © 2019 Alex Findlay. All rights reserved.
//
import Cocoa
import WebKit

class ViewController: NSViewController {
    
    var loginWebView: WKWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.loginWebView = WKWebView(frame: self.view.frame)
        self.view.addSubview(loginWebView)
        let urlReq = URLRequest(url: URL(string: "http://homeassistant:8123/")!)
        self.loginWebView.load(urlReq)
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}
