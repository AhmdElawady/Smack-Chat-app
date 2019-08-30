//
//  LogUpViewController.swift
//  Smack
//
//  Created by Awady on 8/30/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit

class LogUpViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
