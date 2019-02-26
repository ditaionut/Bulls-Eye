//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Ionut Dita on 25/02/2019.
//  Copyright © 2019 Ionut Dita. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

         if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    


    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
