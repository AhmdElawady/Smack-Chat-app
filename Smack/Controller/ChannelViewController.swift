//
//  ChannelViewController.swift
//  Smack
//
//  Created by Awady on 8/29/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {
    
// OutLets
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.width - 60
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    


}
