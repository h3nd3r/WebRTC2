//
//  SecondViewController.swift
//  WebRTC2
//
//  Created by Sara on 11/27/17.
//  Copyright © 2017 Sara. All rights reserved.
//

import UIKit
import SafariServices

class SecondViewController: UIViewController, SFSafariViewControllerDelegate {

  @IBOutlet weak var safeView: UIView!
  var safari: SFSafariViewController?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    safari = SFSafariViewController(url: URL(string: "https://appr.tc/r/978949844")!)
    safari?.delegate = self
    safari?.modalPresentationStyle = .custom
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    if let safari = safari {
      present(safari, animated: false, completion: nil)
    }
  }

  func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
    //dismiss(animated: false, completion: nil)
  }

  func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
    self.safari = nil
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

