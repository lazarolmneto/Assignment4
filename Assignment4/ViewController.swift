//
//  ViewController.swift
//  Assignment4
//
//  Created by Lazaro Neto on 19/12/16.
//  Copyright © 2016 Lazaro Neto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sharedWebservice.getProfiles { (result, success, error) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

