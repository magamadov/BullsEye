//
//  AboutViewController.swift
//  BulldEye
//
//  Created by ZELIMKHAN MAGAMADOV on 12.03.2020.
//  Copyright © 2020 ZELIMKHAN MAGAMADOV. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url)
            // let request = URLRequest(url: url)
            // webView.load(request)
        } else {
            print("html file not found")
        }
        
        
        
    }
    
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var webView: WKWebView!
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
        
}
