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
    
    @IBOutlet var pageWebView: WKWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let urlReq = URLRequest(url: URL(string: "http://homeassistant:8123/")!)
        self.pageWebView.load(urlReq)
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}
