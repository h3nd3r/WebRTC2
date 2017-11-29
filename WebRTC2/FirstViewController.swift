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
  @IBOutlet weak var textField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    textField.delegate = self

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.urlString = textField.text ?? ""

    webView.allowsBackForwardNavigationGestures = true

    loadURL()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func loadURL() {
    webView.load(URLRequest(url: URL(string: textField.text ?? "" )!))
  }
}

extension FirstViewController: UITextFieldDelegate {
  func textFieldDidEndEditing(_ textField: UITextField) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.urlString = textField.text ?? ""
    loadURL()
  }

}

