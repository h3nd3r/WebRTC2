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

    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    safari = SFSafariViewController(url: URL(string: appDelegate.urlString)!)


    let configuration: SFSafariViewController.Configuration = SFSafariViewController.Configuration()
    configuration.barCollapsingEnabled = false
    configuration.entersReaderIfAvailable = true
    safari = SFSafariViewController(url: URL(string: appDelegate.urlString)!, configuration: configuration)

    safari?.delegate = self
    safari?.modalPresentationStyle = .custom
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    if safari == nil {
      let configuration: SFSafariViewController.Configuration = SFSafariViewController.Configuration()
      configuration.barCollapsingEnabled = false
      configuration.entersReaderIfAvailable = true
      safari = SFSafariViewController(url: URL(string: appDelegate.urlString)!, configuration: configuration)

    }

    present(safari!, animated: false, completion: nil)
  }

  func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
    //dismiss(animated: false, completion: nil)
    
    // SFSafariViewController will present an error message in the browser,
    // but in this case we will dismiss the view controller and present our
    // own error alert.
    if didLoadSuccessfully == false {
      controller.dismiss(animated: true, completion: { [unowned self] () -> Void in
        let alert = UIAlertController(title: "Could Not Load", message: "The URL could not be loaded.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
      })
    }
  }

  func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
    self.safari = nil
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

