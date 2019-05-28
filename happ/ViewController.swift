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
    var targetURL = URL(string: "http://homeassistant:8123/")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        pageWebView = WKWebView(frame: self.view.frame)
        pageWebView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pageWebView)
        [pageWebView.topAnchor.constraint(equalTo: view.topAnchor),
         pageWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         pageWebView.leftAnchor.constraint(equalTo: view.leftAnchor),
         pageWebView.rightAnchor.constraint(equalTo: view.rightAnchor)].forEach  {
            anchor in
            anchor.isActive = true
        }
        
        let urlRequest = URLRequest(url: targetURL!)
        pageWebView.load(urlRequest)
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    // MARK: - IBActions - menus
    
    @IBAction func flushPageWebView(_ sender: Any) {
        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
        print("[happ] Cookies deleted")
        
        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { items in
            items.forEach { item in
                WKWebsiteDataStore.default().removeData(ofTypes: item.dataTypes, for: [item], completionHandler: {})
                print("[happ] Item \(item) deleted")
            }
        }

        reloadPageWebView(true)
    }
    
    @IBAction func reloadPageWebView(_ sender: Any) {
        let urlRequest = URLRequest(url: targetURL!)
        pageWebView.load(urlRequest)
        print("[happ] Reloaded page")
    }

}
