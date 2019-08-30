//
//  LoginViewController.swift
//  Smack
//
//  Created by Awady on 8/30/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func closePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    

}
