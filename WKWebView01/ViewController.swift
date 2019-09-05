//
//  ViewController.swift
//  WKWebView01
//
//  Created by amadeus on 05/09/2019.
//  Copyright © 2019 DIT Apps. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        
        let request = URLRequest(url: URL(string: "http://www.naver.com")!)
        
        webView.load(request)
    }

    @IBAction func backAction(_ sender: Any) {
        if self.webView.canGoBack {
            self.webView.goBack()
        }
    }
    
    @IBAction func forwardAction(_ sender: Any) {
        if self.webView.canGoForward {
            self.webView.goForward()
        }
    }
    
    // UISearchBarDelegate 메소드 호출
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let inputURL = searchBar.text!
        let request = URLRequest(url: URL(string: inputURL)!)
        webView.load(request)
        //다른곳을 터치하면 키보드가 내려갈 수 있도록 한다.
        self.view.endEditing(true)
    }
}

