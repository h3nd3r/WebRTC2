//
//  FirstViewController.swift
//  WebRTC2
//
//  Created by Sara on 11/27/17.
//  Copyright © 2017 Sara. All rights reserved.
//

import UIKit
import WebKit

class FirstViewController: UIViewController {

  @IBOutlet weak var webView: WKWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    webView.load(URLRequest(url: URL(string: "https://appr.tc/r/978949844")!))
    webView.allowsBackForwardNavigationGestures = true

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

