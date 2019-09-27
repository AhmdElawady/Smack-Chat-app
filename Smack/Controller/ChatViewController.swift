//
//  ChatViewController.swift
//  Smack
//
//  Created by Awady on 8/29/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    // Outlets
    @IBOutlet weak var MenuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MenuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthServices.instance.isLogedIn {
            AuthServices.instance.findUserByEmail { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            }
            
        }
    }
    

}
